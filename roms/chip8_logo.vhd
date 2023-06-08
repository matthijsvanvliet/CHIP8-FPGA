library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package chip8_logo is

    type t_ROM is array (0 to 260 - 1) of std_logic_vector(7 downto 0);
    constant c_ROM : t_ROM := (
        x"00", x"E0", x"61", x"01", x"60", x"08", x"A2", x"50", x"D0", x"1F", x"60", x"10", x"A2", x"5F", x"D0", x"1F", 
        x"60", x"18", x"A2", x"6E", x"D0", x"1F", x"60", x"20", x"A2", x"7D", x"D0", x"1F", x"60", x"28", x"A2", x"8C", 
        x"D0", x"1F", x"60", x"30", x"A2", x"9B", x"D0", x"1F", x"61", x"10", x"60", x"08", x"A2", x"AA", x"D0", x"1F", 
        x"60", x"10", x"A2", x"B9", x"D0", x"1F", x"60", x"18", x"A2", x"C8", x"D0", x"1F", x"60", x"20", x"A2", x"D7", 
        x"D0", x"1F", x"60", x"28", x"A2", x"E6", x"D0", x"1F", x"60", x"30", x"A2", x"F5", x"D0", x"1F", x"12", x"4E", 
        x"0F", x"02", x"02", x"02", x"02", x"02", x"00", x"00", x"1F", x"3F", x"71", x"E0", x"E5", x"E0", x"E8", x"A0", 
        x"0D", x"2A", x"28", x"28", x"28", x"00", x"00", x"18", x"B8", x"B8", x"38", x"38", x"3F", x"BF", x"00", x"19", 
        x"A5", x"BD", x"A1", x"9D", x"00", x"00", x"0C", x"1D", x"1D", x"01", x"0D", x"1D", x"9D", x"01", x"C7", x"29", 
        x"29", x"29", x"27", x"00", x"00", x"F8", x"FC", x"CE", x"C6", x"C6", x"C6", x"C6", x"00", x"49", x"4A", x"49", 
        x"48", x"3B", x"00", x"00", x"00", x"01", x"03", x"03", x"03", x"01", x"F0", x"30", x"90", x"00", x"00", x"80", 
        x"00", x"00", x"00", x"FE", x"C7", x"83", x"83", x"83", x"C6", x"FC", x"E7", x"E0", x"E0", x"E0", x"E0", x"71", 
        x"3F", x"1F", x"00", x"00", x"07", x"02", x"02", x"02", x"02", x"39", x"38", x"38", x"38", x"38", x"B8", x"B8", 
        x"38", x"00", x"00", x"31", x"4A", x"79", x"40", x"3B", x"DD", x"DD", x"DD", x"DD", x"DD", x"DD", x"DD", x"DD", 
        x"00", x"00", x"A0", x"38", x"20", x"A0", x"18", x"CE", x"FC", x"F8", x"C0", x"D4", x"DC", x"C4", x"C5", x"00", 
        x"00", x"30", x"44", x"24", x"14", x"63", x"F1", x"03", x"07", x"07", x"77", x"57", x"53", x"71", x"00", x"00", 
        x"28", x"8E", x"A8", x"A8", x"A6", x"CE", x"87", x"03", x"03", x"03", x"87", x"FE", x"FC", x"00", x"00", x"60", 
        x"90", x"F0", x"80", x"70"
    );

end package;

package body chip8_logo is
end chip8_logo;