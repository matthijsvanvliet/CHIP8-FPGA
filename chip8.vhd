library ieee;
use ieee.std_logic_1164.all; -- For std_logic type definition
use ieee.numeric_std.all; -- For numerical computation (includes logical operations in this file (and, xor, etc))

entity chip8 is
    port (
        -- clock
        i_clck      : in    std_logic;

        -- keypad
        o_PIN_22  : out std_logic;
        o_PIN_21  : out std_logic;
        o_PIN_20  : out std_logic;
        o_PIN_19  : out std_logic;
        i_PIN_18  : in std_logic;
        i_PIN_17  : in std_logic;
        i_PIN_16  : in std_logic;
        i_PIN_15  : in std_logic;

        -- oled
        o_oled_scl  : inout   std_logic;
        o_oled_sda  : inout   std_logic
    );
end chip8;

architecture rtl of chip8 is

    constant c_DISPLAY_WIDTH    : natural := 64;
    constant c_DISPLAY_HEIGHT   : natural := 32;
    constant c_DISPLAY_LENGTH   : natural := c_DISPLAY_WIDTH * c_DISPLAY_HEIGHT;

    -- CPU signals
    signal r_CLOCK_CPU  : std_logic := '0';
    signal r_KEYS       : std_logic_vector(15 downto 0) := (others => '0');
    signal w_BUFFER     : std_logic_vector(c_DISPLAY_LENGTH - 1 downto 0) := (others => '0');

    -- Display signals
    signal r_CLOCK_DISPLAY  : std_logic := '0';
    signal w_SCL            : std_logic := '0';
    signal w_SDA            : std_logic := '0';

    -- Prescaler
    constant r_FREQ_CLOCK       : integer := 100000000; -- 100 MHz
    constant r_FREQ_4MHZ_CLOCK : integer := 4000000; -- 4 MHz

    constant r_PRESCALER_4MHZ   : integer := r_FREQ_CLOCK / r_FREQ_4MHZ_CLOCK / 2;
    signal r_PRESCALER_4MHZ_COUNTER : integer := 0;
begin

    CPU : entity work.chip8_cpu
        port map (
            i_clck      => r_CLOCK_CPU,
            i_keys      => r_KEYS,
            o_buffer    => w_BUFFER
        );

    DISPLAY : entity work.display
        port map (
            i_clck      => r_CLOCK_DISPLAY,
            i_buffer    => w_BUFFER,
            o_oled_scl  => w_SCL,
            o_oled_sda  => w_SDA
        );

    o_oled_scl <= w_SCL;
    o_oled_sda <= w_SDA;

    r_CLOCK_DISPLAY <= i_clck;

    p_CLOCK_100HZ_TO_4HZ : process (i_clck) is
    begin
        if rising_edge(i_clck) then 
            if r_PRESCALER_4MHZ_COUNTER = r_PRESCALER_4MHZ then
                r_CLOCK_CPU <= not r_CLOCK_CPU;
                r_PRESCALER_4MHZ_COUNTER <= 0;
            else 
                r_PRESCALER_4MHZ_COUNTER <= r_PRESCALER_4MHZ_COUNTER + 1;
            end if;
        end if;
    end process;

end rtl;
