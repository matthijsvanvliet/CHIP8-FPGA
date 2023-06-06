library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package test_opcodes is

    type t_TEST_OPCODES_DATA is array (0 to 478 - 1) of std_logic_vector(7 downto 0);
    constant c_TEST_OPCODES_DATA : t_TEST_OPCODES_DATA := (
        x"12", x"4E", x"EA", x"AC", x"AA", x"EA", x"CE", x"AA", x"AA", x"AE", x"E0", x"A0", x"A0", x"E0", x"C0", x"40", 
        x"40", x"E0", x"E0", x"20", x"C0", x"E0", x"E0", x"60", x"20", x"E0", x"A0", x"E0", x"20", x"20", x"60", x"40", 
        x"20", x"40", x"E0", x"80", x"E0", x"E0", x"E0", x"20", x"20", x"20", x"E0", x"E0", x"A0", x"E0", x"E0", x"E0", 
        x"20", x"E0", x"40", x"A0", x"E0", x"A0", x"E0", x"C0", x"80", x"E0", x"E0", x"80", x"C0", x"80", x"A0", x"40", 
        x"A0", x"A0", x"A2", x"02", x"DA", x"B4", x"00", x"EE", x"A2", x"02", x"DA", x"B4", x"13", x"DC", x"68", x"01", 
        x"69", x"05", x"6A", x"0A", x"6B", x"01", x"65", x"2A", x"66", x"2B", x"A2", x"16", x"D8", x"B4", x"A2", x"3E", 
        x"D9", x"B4", x"A2", x"02", x"36", x"2B", x"A2", x"06", x"DA", x"B4", x"6B", x"06", x"A2", x"1A", x"D8", x"B4", 
        x"A2", x"3E", x"D9", x"B4", x"A2", x"06", x"45", x"2A", x"A2", x"02", x"DA", x"B4", x"6B", x"0B", x"A2", x"1E", 
        x"D8", x"B4", x"A2", x"3E", x"D9", x"B4", x"A2", x"06", x"55", x"60", x"A2", x"02", x"DA", x"B4", x"6B", x"10", 
        x"A2", x"26", x"D8", x"B4", x"A2", x"3E", x"D9", x"B4", x"A2", x"06", x"76", x"FF", x"46", x"2A", x"A2", x"02", 
        x"DA", x"B4", x"6B", x"15", x"A2", x"2E", x"D8", x"B4", x"A2", x"3E", x"D9", x"B4", x"A2", x"06", x"95", x"60", 
        x"A2", x"02", x"DA", x"B4", x"6B", x"1A", x"A2", x"32", x"D8", x"B4", x"A2", x"3E", x"D9", x"B4", x"22", x"42", 
        x"68", x"17", x"69", x"1B", x"6A", x"20", x"6B", x"01", x"A2", x"0A", x"D8", x"B4", x"A2", x"36", x"D9", x"B4", 
        x"A2", x"02", x"DA", x"B4", x"6B", x"06", x"A2", x"2A", x"D8", x"B4", x"A2", x"0A", x"D9", x"B4", x"A2", x"06", 
        x"87", x"50", x"47", x"2A", x"A2", x"02", x"DA", x"B4", x"6B", x"0B", x"A2", x"2A", x"D8", x"B4", x"A2", x"0E", 
        x"D9", x"B4", x"A2", x"06", x"67", x"2A", x"87", x"B1", x"47", x"2B", x"A2", x"02", x"DA", x"B4", x"6B", x"10", 
        x"A2", x"2A", x"D8", x"B4", x"A2", x"12", x"D9", x"B4", x"A2", x"06", x"66", x"78", x"67", x"1F", x"87", x"62", 
        x"47", x"18", x"A2", x"02", x"DA", x"B4", x"6B", x"15", x"A2", x"2A", x"D8", x"B4", x"A2", x"16", x"D9", x"B4", 
        x"A2", x"06", x"66", x"78", x"67", x"1F", x"87", x"63", x"47", x"67", x"A2", x"02", x"DA", x"B4", x"6B", x"1A", 
        x"A2", x"2A", x"D8", x"B4", x"A2", x"1A", x"D9", x"B4", x"A2", x"06", x"66", x"8C", x"67", x"8C", x"87", x"64", 
        x"47", x"18", x"A2", x"02", x"DA", x"B4", x"68", x"2C", x"69", x"30", x"6A", x"34", x"6B", x"01", x"A2", x"2A", 
        x"D8", x"B4", x"A2", x"1E", x"D9", x"B4", x"A2", x"06", x"66", x"8C", x"67", x"78", x"87", x"65", x"47", x"EC", 
        x"A2", x"02", x"DA", x"B4", x"6B", x"06", x"A2", x"2A", x"D8", x"B4", x"A2", x"22", x"D9", x"B4", x"A2", x"06", 
        x"66", x"E0", x"86", x"6E", x"46", x"C0", x"A2", x"02", x"DA", x"B4", x"6B", x"0B", x"A2", x"2A", x"D8", x"B4", 
        x"A2", x"36", x"D9", x"B4", x"A2", x"06", x"66", x"0F", x"86", x"66", x"46", x"07", x"A2", x"02", x"DA", x"B4", 
        x"6B", x"10", x"A2", x"3A", x"D8", x"B4", x"A2", x"1E", x"D9", x"B4", x"A3", x"E8", x"60", x"00", x"61", x"30", 
        x"F1", x"55", x"A3", x"E9", x"F0", x"65", x"A2", x"06", x"40", x"30", x"A2", x"02", x"DA", x"B4", x"6B", x"15", 
        x"A2", x"3A", x"D8", x"B4", x"A2", x"16", x"D9", x"B4", x"A3", x"E8", x"66", x"89", x"F6", x"33", x"F2", x"65", 
        x"A2", x"02", x"30", x"01", x"A2", x"06", x"31", x"03", x"A2", x"06", x"32", x"07", x"A2", x"06", x"DA", x"B4", 
        x"6B", x"1A", x"A2", x"0E", x"D8", x"B4", x"A2", x"3E", x"D9", x"B4", x"12", x"48", x"13", x"DC"
    );

end package;

package body test_opcodes is
end test_opcodes;