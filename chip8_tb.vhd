library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chip8_tb is
end chip8_tb;

architecture behave of chip8_tb is

    component chip8
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
    end component chip8;

    -- Clock signals
    signal r_CLOCK_TB  : std_logic := '0';

    -- Input keys
    signal r_KEY_22 : std_logic;
    signal r_KEY_21 : std_logic;
    signal r_KEY_20 : std_logic;
    signal r_KEY_19 : std_logic;
    signal r_KEY_18 : std_logic;
    signal r_KEY_17 : std_logic;
    signal r_KEY_16 : std_logic;
    signal r_KEY_15 : std_logic;

    signal w_SCL    : std_logic;
    signal w_SDA    : std_logic;

begin

    DUT : chip8
        port map (
            -- clock
            i_clck      => r_CLOCK_TB,

            -- keypad
            o_PIN_22    => r_KEY_22,
            o_PIN_21    => r_KEY_21,
            o_PIN_20    => r_KEY_20,
            o_PIN_19    => r_KEY_19,
            i_PIN_18    => r_KEY_18,
            i_PIN_17    => r_KEY_17,
            i_PIN_16    => r_KEY_16,
            i_PIN_15    => r_KEY_15,

            -- oled
            o_oled_scl  => w_SCL,
            o_oled_sda  => w_SDA
        );

    p_CLOCK_TB : process is
    begin
        r_CLOCK_TB <= not r_CLOCK_TB;
        wait for 10 ns; -- 100 MHz
    end process p_CLOCK_TB;

end behave;