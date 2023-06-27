library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package br8kout is

    type t_ROM is array (0 to 199 - 1) of std_logic_vector(7 downto 0);
    constant c_ROM : t_ROM := (
        x"12", x"9F", x"FC", x"FC", x"80", x"A2", x"02", x"DD", x"C1", x"00", x"EE", x"A2", x"04", x"DB", x"A1", x"00", 
        x"EE", x"A2", x"03", x"60", x"02", x"61", x"05", x"87", x"00", x"86", x"10", x"D6", x"71", x"71", x"08", x"6F", 
        x"38", x"8F", x"17", x"4F", x"00", x"12", x"17", x"70", x"02", x"6F", x"10", x"8F", x"07", x"4F", x"00", x"12", 
        x"15", x"00", x"EE", x"22", x"05", x"7D", x"04", x"22", x"05", x"00", x"EE", x"22", x"05", x"7D", x"FC", x"22", 
        x"05", x"00", x"EE", x"80", x"80", x"40", x"01", x"68", x"FF", x"40", x"FF", x"68", x"01", x"5A", x"C0", x"22", 
        x"53", x"00", x"EE", x"80", x"B0", x"70", x"FB", x"61", x"F8", x"80", x"12", x"70", x"05", x"A2", x"03", x"D0", 
        x"A1", x"00", x"EE", x"22", x"0B", x"8B", x"94", x"8A", x"84", x"22", x"0B", x"4B", x"00", x"69", x"01", x"4B", 
        x"3F", x"69", x"FF", x"4A", x"00", x"68", x"01", x"4A", x"1F", x"68", x"FF", x"4F", x"01", x"22", x"43", x"4A", 
        x"1F", x"22", x"85", x"00", x"EE", x"00", x"E0", x"6B", x"1E", x"6A", x"14", x"22", x"05", x"22", x"0B", x"22", 
        x"11", x"00", x"EE", x"FE", x"07", x"3E", x"00", x"12", x"93", x"6E", x"04", x"FE", x"15", x"00", x"EE", x"6D", 
        x"1E", x"6C", x"1E", x"6B", x"40", x"6A", x"1D", x"C9", x"01", x"49", x"00", x"69", x"FF", x"68", x"FF", x"22", 
        x"05", x"22", x"0B", x"22", x"11", x"60", x"07", x"E0", x"A1", x"22", x"3B", x"60", x"09", x"E0", x"A1", x"22", 
        x"33", x"22", x"63", x"22", x"93", x"12", x"B5"
    );

end package;

package body br8kout is
end br8kout;