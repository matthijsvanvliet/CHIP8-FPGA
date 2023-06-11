library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
    generic
    (
        g_INPUT_CLOCK_FREQ : integer := 50_000_000
    );
    port (
        -- clock
        i_clck      : in    std_logic;

        -- oled
        o_oled_scl  : inout std_logic;
        o_oled_sda  : inout std_logic;

        -- temp
        o_oled_vcc : out std_logic;
        o_oled_gnd : out std_logic
    );
end display;

architecture rtl of display is

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
    --signal r_CLOCK_IN       : std_logic := '0';

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
        s_CLOCK_INIT,
        s_COM_INIT,
        s_SEND_CONTROL,
        s_INIT,
        s_START,
        s_TEMP
    );
    signal r_SM_DISPLAY : t_SM_DISPLAY := s_CLOCK_INIT;

    constant c_SLAVE_ADDRESS : std_logic_vector(6 downto 0) := "0111100"; -- 0x3C

    constant c_SSD1306_MEMORYMODE           : std_logic_vector(7 downto 0) := x"20";
    constant c_SSD1306_COLUMNADDR           : std_logic_vector(7 downto 0) := x"21";
    constant c_SSD1306_PAGEADDR             : std_logic_vector(7 downto 0) := x"22";
    constant c_SSD1306_SETSTARTLINE         : std_logic_vector(7 downto 0) := x"40";
    constant c_SSD1306_SETCONTRAST          : std_logic_vector(7 downto 0) := x"81";
    constant c_SSD1306_CHARGEPUMP           : std_logic_vector(7 downto 0) := x"8D";
    constant c_SSD1306_SEGREMAP             : std_logic_vector(7 downto 0) := x"A0";
    constant c_SSD1306_DISPLAYALLON_RESUME  : std_logic_vector(7 downto 0) := x"A4";
    constant c_SSD1306_NORMALDISPLAY        : std_logic_vector(7 downto 0) := x"A6";
    constant c_SSD1306_INVERTDISPLAY        : std_logic_vector(7 downto 0) := x"A7";
    constant c_SSD1306_SETMULTIPLEX         : std_logic_vector(7 downto 0) := x"A8";
    constant c_SSD1306_DISPLAYOFF           : std_logic_vector(7 downto 0) := x"AE";
    constant c_SSD1306_DISPLAYON            : std_logic_vector(7 downto 0) := x"AF";
    constant c_SSD1306_COMSCANDEC           : std_logic_vector(7 downto 0) := x"C8";
    constant c_SSD1306_SETDISPLAYOFFSET     : std_logic_vector(7 downto 0) := x"D3";
    constant c_SSD1306_SETDISPLAYCLOCKDIV   : std_logic_vector(7 downto 0) := x"D5";
    constant c_SSD1306_SETPRECHARGE         : std_logic_vector(7 downto 0) := x"D9";
    constant c_SSD1306_SETCOMPINS           : std_logic_vector(7 downto 0) := x"DA";
    constant c_SSD1306_SETVCOMDETECT        : std_logic_vector(7 downto 0) := x"DB";

    constant c_SSD1306_RIGHT_HORIZONTAL_SCROLL              : std_logic_vector(7 downto 0) := x"26"; -- Init rt scroll
    constant c_SSD1306_LEFT_HORIZONTAL_SCROLL               : std_logic_vector(7 downto 0) := x"27"; -- Init left scroll
    constant c_SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL : std_logic_vector(7 downto 0) := x"29"; -- Init diag scroll
    constant c_SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL  : std_logic_vector(7 downto 0) := x"2A"; -- Init diag scroll
    constant c_SSD1306_DEACTIVATE_SCROLL                    : std_logic_vector(7 downto 0) := x"2E"; -- Stop scroll
    constant c_SSD1306_ACTIVATE_SCROLL                      : std_logic_vector(7 downto 0) := x"2F"; -- Start scroll
    constant c_SSD1306_SET_VERTICAL_SCROLL_AREA             : std_logic_vector(7 downto 0) := x"A3"; -- Set scroll range

    signal r_PREV_BUSY      : std_logic := '0';
    signal r_COM_COUNTER    : integer   := 0;

    constant c_DELAY_BETWEEN_COM : integer := (c_INPUT_CLOCK / c_BUS_CLOCK) * 10; -- 10 scl clock cycles between commands (~30 us)
    signal r_DELAY_COUNTER : integer := 0;

    constant c_INIT_COMMAND_LENGTH : integer := 26;
    type t_INIT_COMMANDS is array (0 to c_INIT_COMMAND_LENGTH-1) of std_logic_vector(7 downto 0);
    constant c_INIT_COMMANDS : t_INIT_COMMANDS := (
        c_SSD1306_DISPLAYOFF,
        c_SSD1306_SETDISPLAYCLOCKDIV,
        x"80",
        c_SSD1306_SETMULTIPLEX,
        x"1F",
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
        x"02",
        c_SSD1306_SETCONTRAST,
        x"8F",
        c_SSD1306_SETPRECHARGE,
        x"F1",
        c_SSD1306_SETVCOMDETECT,
        x"40",
        c_SSD1306_DISPLAYALLON_RESUME,
        c_SSD1306_NORMALDISPLAY,
        c_SSD1306_DEACTIVATE_SCROLL,
        c_SSD1306_DISPLAYON
    );

    constant c_DISPLAY_BUFFER_WIDTH     : natural   := 64;
    constant c_DISPLAY_BUFFER_HEIGHT    : natural   := 32;

    signal r_DISPLAY_BUFFER : std_logic_vector(c_DISPLAY_BUFFER_WIDTH * c_DISPLAY_BUFFER_HEIGHT - 1 downto 0) := (others => '0');

    constant c_BUFFER_LENGTH : natural := c_DISPLAY_BUFFER_WIDTH * ((c_DISPLAY_BUFFER_HEIGHT + 7) / 8);
    type t_BUFFER_BYTE is array (0 to c_BUFFER_LENGTH) of std_logic_vector(7 downto 0);
    signal r_BUFFER : t_BUFFER_BYTE := (others => x"00");

    function get_x(
            i : natural
        )
        return natural is
            variable x : natural := 0;
    begin
        x := i mod (c_DISPLAY_BUFFER_WIDTH - 1);
        return x;
    end get_x;

    function get_y(
            i : natural
        )
        return natural is
            variable y : natural := 0;
    begin
        y := (i - get_x(i)) mod (c_DISPLAY_BUFFER_HEIGHT - 1);
        return y;
    end get_y;

begin

    I2C_CONTROLLER : entity work.i2c_master
        generic map (
            input_clk   => c_INPUT_CLOCK,
            bus_clk     => c_BUS_CLOCK
        )
        port map (
            clk         => r_CLK,      
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

    CLOCK_50HZ : clk_50hz
    port map (-- Clock in ports
        -- Clock out ports
        clk_out1    => w_CLOCK_OUT1,
        -- Status and control signals
        reset       => r_CLOCK_RESET,
        locked      => w_LOCKED,
        i_clck      => i_clck
    );

    o_oled_vcc <= '1';
    o_oled_gnd <= '0';

    o_oled_sda <= w_SDA;
    o_oled_scl <= w_SCL;

    r_CLK <= w_CLOCK_OUT1;

    p_FILL_BUFFER : process (w_CLOCK_OUT1) is
    begin
        for i in 0 to c_BUFFER_LENGTH loop
            r_BUFFER(get_x(i) + (get_y(i) / 8) * c_DISPLAY_BUFFER_WIDTH) <= r_BUFFER(get_x(i) + (get_y(i) / 8) * c_DISPLAY_BUFFER_WIDTH) or std_logic_vector(shift_left(to_unsigned(1, 8), to_integer(to_unsigned(get_y(i), 8) and x"7")));
        end loop;
    end process p_FILL_BUFFER;

    p_INITIALISE : process is
    begin
        r_ADDR <= c_SLAVE_ADDRESS;
        r_RW <= '0';
        for i in 1230 to 1567 loop
            r_DISPLAY_BUFFER(i) <= '1';
        end loop;
        wait;
    end process p_INITIALISE;

    p_STATE_MACHINE : process (w_CLOCK_OUT1) is
        variable v_COUNTER : integer := 0;
    begin
        if rising_edge(w_CLOCK_OUT1) then
            r_PREV_BUSY <= w_BUSY;

            case r_SM_DISPLAY is
                when s_CLOCK_INIT =>
                    r_ENA <= '0';
                    if w_LOCKED = '1' and w_BUSY = '0' then
                        r_SM_DISPLAY <= s_SEND_CONTROL;
                    end if; 
                when s_SEND_CONTROL =>
                    r_DATA_WR <= x"00";
                    r_ENA <= '1';
                    
                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        r_SM_DISPLAY <= s_START;
                        if r_COM_COUNTER /= c_INIT_COMMAND_LENGTH - 1 then
                            r_SM_DISPLAY <= s_INIT;
                        end if;
                    end if;

                when s_INIT =>
                    r_DATA_WR <= c_INIT_COMMANDS(r_COM_COUNTER);

                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        if r_COM_COUNTER = c_INIT_COMMAND_LENGTH - 1 then
                            r_SM_DISPLAY <= s_TEMP;
                        else
                            r_COM_COUNTER <= r_COM_COUNTER + 1;
                        end if;
                    end if;
                    
                when s_START =>
                    r_DATA_WR <= c_SSD1306_INVERTDISPLAY;

                    if w_BUSY = '1' and r_PREV_BUSY = '0' then
                        r_SM_DISPLAY <= s_TEMP;
                    end if;

                when s_TEMP =>
                    r_ENA <= '0';
                    v_COUNTER := v_COUNTER + 1;
                    if v_COUNTER >= 123432 then
                        v_COUNTER := 0;
                        r_SM_DISPLAY <= s_SEND_CONTROL;
                    end if;
                when others => NULL;
            end case;
        end if;
    end process p_STATE_MACHINE;

end rtl;