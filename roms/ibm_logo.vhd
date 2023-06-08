library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ibm_logo is

    type t_ROM is array (0 to 132 - 1) of std_logic_vector(7 downto 0);
    constant c_ROM : t_ROM := (
        x"00", x"E0", x"A2", x"2A", x"60", x"0C", x"61", x"08", x"D0", x"1F", x"70", x"09", x"A2", x"39", x"D0", x"1F", 
        x"A2", x"48", x"70", x"08", x"D0", x"1F", x"70", x"04", x"A2", x"57", x"D0", x"1F", x"70", x"08", x"A2", x"66", 
        x"D0", x"1F", x"70", x"08", x"A2", x"75", x"D0", x"1F", x"12", x"28", x"FF", x"00", x"FF", x"00", x"3C", x"00", 
        x"3C", x"00", x"3C", x"00", x"3C", x"00", x"FF", x"00", x"FF", x"FF", x"00", x"FF", x"00", x"38", x"00", x"3F", 
        x"00", x"3F", x"00", x"38", x"00", x"FF", x"00", x"FF", x"80", x"00", x"E0", x"00", x"E0", x"00", x"80", x"00", 
        x"80", x"00", x"E0", x"00", x"E0", x"00", x"80", x"F8", x"00", x"FC", x"00", x"3E", x"00", x"3F", x"00", x"3B", 
        x"00", x"39", x"00", x"F8", x"00", x"F8", x"03", x"00", x"07", x"00", x"0F", x"00", x"BF", x"00", x"FB", x"00", 
        x"F3", x"00", x"E3", x"00", x"43", x"E5", x"05", x"E2", x"00", x"85", x"07", x"81", x"01", x"80", x"02", x"80", 
        x"07", x"E5", x"05", x"E7"
    );

end package;

package body ibm_logo is
end ibm_logo;