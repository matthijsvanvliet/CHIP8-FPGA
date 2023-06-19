library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ssd1306.all;

entity display is
    generic
    (
        g_INPUT_CLOCK_FREQ      : integer   := 100_000_000;
        g_DISPLAY_BUFFER_WIDTH  : natural   := 64;
        g_DISPLAY_BUFFER_HEIGHT : natural   := 32
    );
    port (
        -- clock
        i_clck      : in    std_logic;

        -- incoming display buffer
        i_buffer        : in std_logic_vector((g_DISPLAY_BUFFER_WIDTH - 1) downto 0);
        i_buffer_sel    : in std_logic_vector(4 downto 0);   

        -- oled
        o_oled_scl  : inout std_logic;
        o_oled_sda  : inout std_logic
    );
end display;

architecture arch_display of display is

    constant c_DISPLAY_BUFFER_WIDTH     : natural   := g_DISPLAY_BUFFER_WIDTH;
    constant c_DISPLAY_BUFFER_HEIGHT    : natural   := g_DISPLAY_BUFFER_HEIGHT;
    constant c_DISPLAY_LENGTH           : natural   := c_DISPLAY_BUFFER_WIDTH * c_DISPLAY_BUFFER_HEIGHT;
    constant c_DISPLAY_BUFFER_LENGTH    : natural   := c_DISPLAY_LENGTH / 8;

    type t_ARRAY_DISPLAY_BUFFER is array (0 to c_DISPLAY_BUFFER_HEIGHT-1) of std_logic_vector(c_DISPLAY_BUFFER_WIDTH - 1 downto 0);
    signal r_ARRAY_DISPLAY_BUFFER : t_ARRAY_DISPLAY_BUFFER := (others => x"0000_0000_0000_0000");

    type t_FORMATTED_DISPLAY_BUFFER is array (0 to c_DISPLAY_BUFFER_LENGTH-1) of std_logic_vector(7 downto 0);
    signal r_FORMATTED_DISPLAY_BUFFER : t_FORMATTED_DISPLAY_BUFFER := (others => x"00");

    component clk_50hz
    port
    (-- Clock in ports
        -- Clock out ports
        clk_out1          : out    std_logic;
        -- Status and control signals
        reset             : in     std_logic;
        locked            : out    std_logic;
        i_clck            : in     std_logic
    );
    end component;

    signal w_CLOCK_OUT1     : std_logic;
    signal r_CLOCK_RESET    : std_logic := '0';
    signal w_LOCKED         : std_logic;

    constant c_INPUT_CLOCK  : integer := g_INPUT_CLOCK_FREQ;
    constant c_BUS_CLOCK    : integer := 400_000;

    signal r_CLK        : std_logic := '0';
    signal r_RESET_N    : std_logic := '1';
    signal r_ENA        : std_logic := '0';
    signal r_ADDR       : std_logic_vector(6 downto 0) := (others => '0');
    signal r_RW         : std_logic := '1';
    signal r_DATA_WR    : std_logic_vector(7 downto 0) := (others => '0');

    signal w_BUSY       : std_logic;
    signal w_DATA_RD    : std_logic_vector(7 downto 0);
    signal w_ACK_ERROR  : std_logic;

    signal w_SDA        : std_logic;
    signal w_SCL        : std_logic;

    type t_SM_DISPLAY is (
        s_SEND_CONTROL,
        s_INIT,
        s_REFRESH,
        s_DELAY,
        s_SEND_PIXEL_DATA
    );
    signal r_SM_DISPLAY : t_SM_DISPLAY := s_DELAY;

    constant c_SLAVE_ADDRESS : std_logic_vector(6 downto 0) := "0111100"; -- 0x3C

    signal r_PREV_BUSY      : std_logic := '0';

    constant c_INIT_COMMAND_LENGTH : integer := 26;
    type t_INIT_COMMANDS is array (0 to c_INIT_COMMAND_LENGTH-1) of std_logic_vector(7 downto 0);
    constant c_INIT_COMMANDS : t_INIT_COMMANDS := (
        c_SSD1306_DISPLAYOFF,
        c_SSD1306_SETDISPLAYCLOCKDIV,
        x"80",
        c_SSD1306_SETMULTIPLEX,
        x"3F",
        c_SSD1306_SETDISPLAYOFFSET,
        x"00",
        c_SSD1306_SETSTARTLINE or x"00",
        c_SSD1306_CHARGEPUMP,
        x"14",
        c_SSD1306_MEMORYMODE,
        x"00",
        c_SSD1306_SEGREMAP or x"01",
        c_SSD1306_COMSCANDEC,
        c_SSD1306_SETCOMPINS,
        x"12",
        c_SSD1306_SETCONTRAST,
        x"CF",
        c_SSD1306_SETPRECHARGE,
        x"22",
        c_SSD1306_SETVCOMDETECT,
        x"00",
        c_SSD1306_DEACTIVATE_SCROLL,
        c_SSD1306_DISPLAYALLON_RESUME,
        c_SSD1306_NORMALDISPLAY,
        c_SSD1306_DISPLAYON
    );

    constant c_REFRESH_COMMAND_LENGTH : integer := 6;
    type t_REFRESH_COMMANDS is array (0 to c_REFRESH_COMMAND_LENGTH-1) of std_logic_vector(7 downto 0);
    constant c_REFRESH_COMMANDS : t_REFRESH_COMMANDS := (
        c_SSD1306_PAGEADDR,
        x"00",
        x"07",
        c_SSD1306_COLUMNADDR,
        x"20",
        x"5F"
    );

    signal r_COM_COUNTER        : integer   := 0;
    signal r_REFRESH_COUNTER    : integer   := 0;
    signal r_PIXEL_COUNTER      : integer   := 0;

    signal r_START_PIXEL_DATA   : std_logic := '0';

    constant c_DELAY_TIME       : integer   := (c_INPUT_CLOCK / c_BUS_CLOCK) * 100; -- 100 sla clock pulses
    constant c_SETUP_DELAY_TIME : integer   := g_INPUT_CLOCK_FREQ; -- 1 sec
    signal r_SETUP_TIME_ENABLE  : std_logic := '1';
    signal r_DELAY_COUNTER      : integer   := 0;

    signal r_BUFFER_SEL : std_logic_vector(7 downto 0) := x"00";

begin

    I2C_CONTROLLER : entity work.i2c_master
        generic map (
            input_clk   => c_INPUT_CLOCK,
            bus_clk     => c_BUS_CLOCK
        )
        port map (
            clk         => i_clck,      
            reset_n     => r_RESET_N,  
            ena         => r_ENA,      
            addr        => r_ADDR,     
            rw          => r_RW,       
            data_wr     => r_DATA_WR,  
            busy        => w_BUSY,     
            data_rd     => w_DATA_RD,  
            ack_error   => w_ACK_ERROR,
            sda         => w_SDA,
            scl         => w_SCL
        );

    o_oled_sda <= w_SDA;
    o_oled_scl <= w_SCL;

    p_INITIALISE : process is
    begin
        r_ADDR <= c_SLAVE_ADDRESS;
        r_RW <= '0';
        wait;
    end process p_INITIALISE;

    p_COLLECT_BUFFER : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            r_ARRAY_DISPLAY_BUFFER(to_integer(unsigned(i_buffer_sel))) <= i_buffer;
        end if;
    end process p_COLLECT_BUFFER;

    -- Rotates vertical slices of 8 bits in the original buffer to an array
    -- with a length of 256 ((width * length) / 8) where each value is 8 bits.
    p_REFORMAT_BUFFER : process (i_clck) is
        variable v_TEMP     : std_logic_vector(c_DISPLAY_LENGTH-1 downto 0) := (others => '0');
        constant c_SLICE    : natural := 8;
        variable v_INDEX    : natural := 0;
    begin
        if rising_edge(i_clck) then 
            for i in 0 to c_DISPLAY_BUFFER_LENGTH - 1 loop
                v_INDEX := i / c_DISPLAY_BUFFER_WIDTH;
                    for j in 0 to c_SLICE - 1 loop
                        r_FORMATTED_DISPLAY_BUFFER(c_DISPLAY_BUFFER_LENGTH-1-i)(c_SLICE - 1 - j) <= r_ARRAY_DISPLAY_BUFFER(j + (c_SLICE * v_INDEX))(c_DISPLAY_BUFFER_WIDTH - 1 - (i mod 64));
                    end loop;
            end loop;
        end if;
    end process p_REFORMAT_BUFFER;

    p_STATE_MACHINE : process (i_clck) is
        variable v_COUNTER : integer := 0;
    begin
        if rising_edge(i_clck) then    
            r_PREV_BUSY <= w_BUSY;

            case r_SM_DISPLAY is
                when s_SEND_CONTROL =>
                    if r_START_PIXEL_DATA = '0' then
                        r_DATA_WR <= x"00";
                    else
                        r_DATA_WR <= c_SSD1306_SETSTARTLINE;
                    end if;
                    r_ENA <= '1';
                    
                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        if r_START_PIXEL_DATA = '0' then
                            r_SM_DISPLAY <= s_REFRESH;
                        else
                            r_SM_DISPLAY <= s_SEND_PIXEL_DATA;
                        end if;
                        if r_COM_COUNTER /= c_INIT_COMMAND_LENGTH - 1 then
                            r_SM_DISPLAY <= s_INIT;
                        end if;
                    end if;
                when s_INIT =>
                    r_DATA_WR <= c_INIT_COMMANDS(r_COM_COUNTER);

                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        if r_COM_COUNTER = c_INIT_COMMAND_LENGTH - 1 then
                            r_SM_DISPLAY <= s_DELAY;
                            r_ENA <= '0';
                        else
                            r_COM_COUNTER <= r_COM_COUNTER + 1;
                        end if;
                    end if;
                when s_DELAY =>
                    r_DELAY_COUNTER <= r_DELAY_COUNTER + 1;
                    r_ENA <= '0';

                    if r_SETUP_TIME_ENABLE = '1' then
                        if r_DELAY_COUNTER = c_SETUP_DELAY_TIME then
                            r_SETUP_TIME_ENABLE <= '0';
                            r_DELAY_COUNTER <= 0;
                            r_SM_DISPLAY <= s_SEND_CONTROL;
                        end if;
                    elsif r_SETUP_TIME_ENABLE = '0' then
                        if r_DELAY_COUNTER = c_DELAY_TIME then
                            r_DELAY_COUNTER <= 0;
                            r_SM_DISPLAY <= s_SEND_CONTROL;
                        end if;
                    end if;
                when s_REFRESH =>
                    r_DATA_WR <= c_REFRESH_COMMANDS(r_REFRESH_COUNTER);

                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        if r_REFRESH_COUNTER = c_REFRESH_COMMAND_LENGTH - 1 then
                            r_ENA <= '0';
                            r_START_PIXEL_DATA <= '1';
                            r_SM_DISPLAY <= s_DELAY;
                            r_REFRESH_COUNTER <= 0;
                        else
                            r_REFRESH_COUNTER <= r_REFRESH_COUNTER + 1;
                        end if;
                    end if;
                when s_SEND_PIXEL_DATA =>
                    r_DATA_WR <= r_FORMATTED_DISPLAY_BUFFER(r_PIXEL_COUNTER);

                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        if r_PIXEL_COUNTER /= c_DISPLAY_BUFFER_LENGTH - 1 then
                            r_PIXEL_COUNTER <= r_PIXEL_COUNTER + 1;
                        else
                            r_ENA <= '0';
                        end if;
                    end if;

                    if w_BUSY = '0' and r_PREV_BUSY = '1' then
                        if r_PIXEL_COUNTER = c_DISPLAY_BUFFER_LENGTH - 1 then
                            r_PIXEL_COUNTER <= 0;
                            r_SM_DISPLAY <= s_DELAY;
                        end if;
                    end if;
                when others => NULL;
            end case;
        end if;
    end process p_STATE_MACHINE;

end arch_display;