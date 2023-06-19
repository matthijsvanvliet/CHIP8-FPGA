library ieee;
use ieee.std_logic_1164.all; -- For std_logic type definition
use ieee.numeric_std.all; -- For numerical computation (includes logical operations in this file (and, xor, etc))

entity chip8 is
    port (
        -- clock
        i_clck      : in    std_logic;

        -- keypad
        i_rows  : inout    std_logic_vector(3 downto 0);
        i_cols  : inout    std_logic_vector(3 downto 0);

        -- oled
        o_oled_scl  : inout   std_logic;
        o_oled_sda  : inout   std_logic
    );
end chip8;

architecture rtl of chip8 is

    constant c_DISPLAY_WIDTH    : natural := 64;
    constant c_DISPLAY_HEIGHT   : natural := 32;
    constant c_DISPLAY_LENGTH   : natural := c_DISPLAY_WIDTH * c_DISPLAY_HEIGHT;

    signal r_CLOCK_100MHZ   : std_logic := '0';

    -- CPU signals
    signal r_CLOCK_CPU  : std_logic := '0';
    signal w_BUFFER     : std_logic_vector(c_DISPLAY_WIDTH - 1 downto 0) := (others => '0');
    signal w_BUFFER_SEL : std_logic_vector(4 downto 0) := "00000";

    -- Display signals
    signal w_SCL            : std_logic := '0';
    signal w_SDA            : std_logic := '0';

    -- Keypad signals
    signal r_RESET_N        : std_logic := '0';
    signal r_ROWS           : std_logic_vector(1 to 4) := (others => '0');
    signal w_COLUMS         : std_logic_vector(1 to 4);
    signal w_KEYS           : std_logic_vector(0 to 15);

    -- Prescaler
    constant r_FREQ_CLOCK       : integer := 100_000_000; -- 100 MHz
    constant r_FREQ_4MHZ_CLOCK : integer := 4_000_000; -- 4 MHz

    constant r_PRESCALER_4MHZ   : integer := r_FREQ_CLOCK / r_FREQ_4MHZ_CLOCK / 2;
    signal r_PRESCALER_4MHZ_COUNTER : integer := 0;
begin

    CPU : entity work.chip8_cpu
        port map (
            i_clck_100mhz   => r_CLOCK_100MHZ,
            i_clck          => r_CLOCK_CPU,
            i_keys          => w_KEYS,
            o_buffer        => w_BUFFER,
            o_buffer_sel    => w_BUFFER_SEL
        );

    DISPLAY : entity work.display
        port map (
            i_clck          => r_CLOCK_100MHZ,
            i_buffer        => w_BUFFER,
            i_buffer_sel    => w_BUFFER_SEL,
            o_oled_scl      => w_SCL,
            o_oled_sda      => w_SDA
        );
    
    KEYPAD : entity work.pmod_keypad
        generic map (
            clk_freq    => 100_000_000,
            stable_time => 10
        )
        port map (
            clk     => r_CLOCK_100MHZ,
            reset_n => r_RESET_N,
            rows    => r_ROWS,
            columns => w_COLUMS,
            keys    => w_KEYS
        );

    o_oled_scl <= w_SCL;
    o_oled_sda <= w_SDA;

    r_ROWS(1) <= i_rows(3);
    r_ROWS(2) <= i_rows(2);
    r_ROWS(3) <= i_rows(1);
    r_ROWS(4) <= i_rows(0);

    w_COLUMS(1) <= i_cols(3);
    w_COLUMS(2) <= i_cols(2);
    w_COLUMS(3) <= i_cols(1);
    w_COLUMS(4) <= i_cols(0);

    r_CLOCK_100MHZ <= i_clck;

    p_INITIALISE_KEYPAD : process is
    begin
        if rising_edge(i_clck) then 
            r_RESET_N <= '1';
        end if;
    end process p_INITIALISE_KEYPAD;

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
    end process p_CLOCK_100HZ_TO_4HZ;

end rtl;
