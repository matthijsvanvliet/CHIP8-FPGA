library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package c8_test is

    type t_ROM is array (0 to 463 - 1) of std_logic_vector(7 downto 0);
    constant c_ROM : t_ROM := (
        x"60", x"FF", x"F0", x"15", x"60", x"00", x"69", x"00", x"6E", x"00", x"60", x"00", x"30", x"01", x"30", x"00", 
        x"13", x"92", x"7E", x"01", x"60", x"01", x"40", x"01", x"40", x"00", x"13", x"92", x"7E", x"01", x"61", x"01", 
        x"62", x"00", x"50", x"20", x"50", x"10", x"13", x"92", x"7E", x"01", x"70", x"02", x"70", x"FF", x"3F", x"00", 
        x"13", x"92", x"30", x"02", x"15", x"00", x"7E", x"01", x"6B", x"F0", x"8C", x"B0", x"5C", x"B0", x"13", x"92", 
        x"7E", x"01", x"6A", x"0F", x"6B", x"F0", x"8A", x"B1", x"3A", x"FF", x"13", x"92", x"7E", x"01", x"6A", x"0F", 
        x"6B", x"F1", x"8A", x"B2", x"3A", x"01", x"13", x"92", x"7E", x"01", x"6A", x"0F", x"6B", x"F1", x"8A", x"B3", 
        x"3A", x"FE", x"13", x"92", x"7E", x"01", x"6A", x"FF", x"6B", x"F1", x"8A", x"B4", x"3A", x"F0", x"13", x"92", 
        x"3F", x"01", x"13", x"92", x"7E", x"01", x"6F", x"00", x"6A", x"FF", x"6B", x"F1", x"8A", x"B5", x"3A", x"0E", 
        x"13", x"92", x"3F", x"01", x"13", x"92", x"79", x"01", x"6E", x"00", x"6F", x"00", x"6A", x"04", x"8A", x"06", 
        x"3A", x"02", x"13", x"00", x"3F", x"00", x"13", x"92", x"6A", x"05", x"8A", x"06", x"3A", x"02", x"13", x"00", 
        x"3F", x"01", x"13", x"92", x"7E", x"01", x"6A", x"F0", x"6B", x"C3", x"8A", x"B7", x"3A", x"D3", x"13", x"92", 
        x"3F", x"00", x"13", x"92", x"6A", x"C3", x"6B", x"F0", x"8A", x"B7", x"3A", x"2D", x"13", x"92", x"3F", x"01", 
        x"13", x"92", x"7E", x"01", x"6A", x"04", x"8A", x"0E", x"3A", x"08", x"13", x"92", x"3F", x"00", x"13", x"92", 
        x"6A", x"84", x"8A", x"0E", x"3A", x"08", x"13", x"92", x"3F", x"01", x"13", x"92", x"7E", x"01", x"6A", x"00", 
        x"6B", x"00", x"9A", x"B0", x"5A", x"B0", x"13", x"92", x"6A", x"01", x"9A", x"B0", x"13", x"92", x"7E", x"01", 
        x"60", x"04", x"B2", x"FC", x"13", x"92", x"13", x"92", x"13", x"92", x"13", x"92", x"13", x"92", x"13", x"92", 
        x"7E", x"01", x"CA", x"0F", x"CB", x"F0", x"8A", x"B2", x"3A", x"00", x"13", x"92", x"CA", x"FF", x"CB", x"FF", 
        x"9A", x"B0", x"13", x"92", x"7E", x"01", x"FA", x"07", x"4A", x"FF", x"13", x"92", x"7E", x"01", x"6A", x"FF", 
        x"A5", x"00", x"FA", x"33", x"F2", x"65", x"30", x"02", x"13", x"92", x"31", x"05", x"13", x"92", x"32", x"05", 
        x"13", x"92", x"7E", x"01", x"60", x"00", x"61", x"01", x"62", x"02", x"63", x"03", x"64", x"04", x"F4", x"55", 
        x"60", x"FF", x"61", x"FF", x"62", x"FF", x"63", x"FF", x"64", x"FF", x"F4", x"65", x"30", x"00", x"13", x"92", 
        x"34", x"04", x"13", x"92", x"7E", x"01", x"60", x"FC", x"A5", x"50", x"F0", x"55", x"A5", x"40", x"60", x"10", 
        x"F0", x"1E", x"F0", x"65", x"30", x"FC", x"13", x"92", x"6E", x"00", x"79", x"01", x"3E", x"00", x"15", x"00", 
        x"39", x"02", x"13", x"92", x"6A", x"19", x"6B", x"10", x"A3", x"88", x"DA", x"B5", x"6A", x"20", x"6B", x"10", 
        x"A3", x"8D", x"DA", x"B5", x"6F", x"00", x"13", x"86", x"60", x"90", x"90", x"90", x"60", x"90", x"A0", x"C0", 
        x"A0", x"90", x"00", x"E0", x"F9", x"29", x"65", x"10", x"64", x"19", x"D4", x"55", x"6F", x"00", x"FE", x"29", 
        x"65", x"10", x"64", x"20", x"D4", x"55", x"6F", x"00", x"13", x"A8", x"03", x"05", x"16", x"27", x"38", x"49", 
        x"51", x"61", x"71", x"E1", x"01", x"15", x"16", x"07", x"ED", x"17", x"33", x"65", x"18", x"55", x"65", x"19", 
        x"1E", x"EA", x"EB", x"DD", x"ED", x"00", x"E0", x"00", x"EE", x"9E", x"A1", x"0A", x"18", x"29", x"0A"
    );

end package;

package body c8_test is
end c8_test;