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
        o_oled_scl  : out   std_logic;
        o_oled_sda  : out   std_logic
    );
end chip8;

architecture rtl of chip8 is

    component chip8_cpu
        port (
            -- clock
            i_clck      : in    std_logic
        );
    end component chip8_cpu;

    -- Clock signals
    signal r_CLOCK  : std_logic := '0';

begin

    CPU : chip8_cpu
        port map (
            -- clock
            i_clck      => r_CLOCK
        );

    o_oled_gnd <= '0';
    o_oled_vcc <= '1';

end rtl;
