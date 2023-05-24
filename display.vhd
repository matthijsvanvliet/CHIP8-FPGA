library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
    port (
        -- clock
        i_clck      : in    std_logic;

        -- oled
        o_oled_gnd  : out   std_logic;
        o_oled_vcc  : out   std_logic;
        o_oled_scl  : inout std_logic;
        o_oled_sda  : inout std_logic
    );
end display;

architecture arch_display of display is

    component i2c_master IS
        generic (
            input_clk : integer; --input clock speed from user logic in Hz
            bus_clk   : integer  --speed the i2c bus (scl) will run at in Hz
        );   
        port (
            clk       : in     std_logic;                    --system clock
            reset_n   : in     std_logic;                    --active low reset
            ena       : in     std_logic;                    --latch in command
            addr      : in     std_logic_vector(6 downto 0); --address of target slave
            rw        : in     std_logic;                    --'0' is write, '1' is read
            data_wr   : in     std_logic_vector(7 downto 0); --data to write to slave
            busy      : out    std_logic;                    --indicates transaction in progress
            data_rd   : out    std_logic_vector(7 downto 0); --data read from slave
            ack_error : buffer std_logic;                    --flag if improper acknowledge from slave
            sda       : inout  std_logic;                    --serial data output of i2c bus
            scl       : inout  std_logic                     --serial clock output of i2c bus
        );                   
    end component i2c_master;

    constant c_INPUT_CLOCK  : integer := 40_000_000;
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

    type t_SM_DISPLAY is (
        s_INIT,
        s_START
    );
    signal r_SM_DISPLAY : t_SM_DISPLAY := s_INIT;

    constant c_SLAVE_ADDRESS : std_logic_vector(6 downto 0) := "0111100";

    constant c_SSD1306_MEMORYMODE           : std_logic_vector(7 downto 0) := x"20";
    constant c_SSD1306_COLUMNADDR           : std_logic_vector(7 downto 0) := x"21";
    constant c_SSD1306_PAGEADDR             : std_logic_vector(7 downto 0) := x"22";
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

begin

    I2C_CONTROLLER : i2c_master
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
            sda         => o_oled_sda,
            scl         => o_oled_scl
        );

    o_oled_gnd <= '0';
    o_oled_vcc <= '1';

    r_CLK <= i_clck;

    p_STATE_MACHINE : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            
            case r_SM_DISPLAY is
                when s_INIT =>
                    r_ENA <= '1';
                    r_ADDR <= c_SLAVE_ADDRESS;
                    r_RW <= '0';
                    r_DATA_WR <= c_SSD1306_COLUMNADDR;

                    r_SM_DISPLAY <= s_START;
                when s_START =>
                    r_SM_DISPLAY <= s_START;
                when others =>
                    r_SM_DISPLAY <= s_START;
            end case;
        end if;
    end process p_STATE_MACHINE;

end arch_display;