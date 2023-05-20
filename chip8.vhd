library ieee;
use ieee.std_logic_1164.all; -- For std_logic type definition
use ieee.numeric_std.all; -- For numerical computation (includes logical operations in this file (and, xor, etc))

entity chip8 is
    port (
        -- clock
        i_clck      : in    std_logic;

        -- keypad
        i_keypad    : in    std_logic_vector(15 downto 0);

        -- oled
        o_oled_gnd  : out   std_logic;
        o_oled_vcc  : out   std_logic;
        o_oled_scl  : out   std_logic;
        o_oled_sda  : out   std_logic
    );
end chip8;

architecture rtl of chip8 is



begin
    o_oled_gnd <= '0';
    o_oled_vcc <= '1';

end rtl;
