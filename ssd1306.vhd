library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ssd1306 is

    constant c_SSD1306_MEMORYMODE           : std_logic_vector(7 downto 0) := x"20";
    constant c_SSD1306_COLUMNADDR           : std_logic_vector(7 downto 0) := x"21";
    constant c_SSD1306_PAGEADDR             : std_logic_vector(7 downto 0) := x"22";
    constant c_SSD1306_SETSTARTLINE         : std_logic_vector(7 downto 0) := x"40";
    constant c_SSD1306_SETCONTRAST          : std_logic_vector(7 downto 0) := x"81";
    constant c_SSD1306_CHARGEPUMP           : std_logic_vector(7 downto 0) := x"8D";
    constant c_SSD1306_SEGREMAP             : std_logic_vector(7 downto 0) := x"A0";
    constant c_SSD1306_DISPLAYALLON_RESUME  : std_logic_vector(7 downto 0) := x"A4";
    constant c_SSD1306_NORMALDISPLAY        : std_logic_vector(7 downto 0) := x"A6";
    constant c_SSD1306_INVERTDISPLAY        : std_logic_vector(7 downto 0) := x"A7";
    constant c_SSD1306_SETMULTIPLEX         : std_logic_vector(7 downto 0) := x"A8";
    constant c_SSD1306_DISPLAYOFF           : std_logic_vector(7 downto 0) := x"AE";
    constant c_SSD1306_DISPLAYON            : std_logic_vector(7 downto 0) := x"AF";
    constant c_SSD1306_COMSCANDEC           : std_logic_vector(7 downto 0) := x"C8";
    constant c_SSD1306_SETDISPLAYOFFSET     : std_logic_vector(7 downto 0) := x"D3";
    constant c_SSD1306_SETDISPLAYCLOCKDIV   : std_logic_vector(7 downto 0) := x"D5";
    constant c_SSD1306_SETPRECHARGE         : std_logic_vector(7 downto 0) := x"D9";
    constant c_SSD1306_SETCOMPINS           : std_logic_vector(7 downto 0) := x"DA";
    constant c_SSD1306_SETVCOMDETECT        : std_logic_vector(7 downto 0) := x"DB";

    constant c_SSD1306_RIGHT_HORIZONTAL_SCROLL              : std_logic_vector(7 downto 0) := x"26"; -- Init rt scroll
    constant c_SSD1306_LEFT_HORIZONTAL_SCROLL               : std_logic_vector(7 downto 0) := x"27"; -- Init left scroll
    constant c_SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL : std_logic_vector(7 downto 0) := x"29"; -- Init diag scroll
    constant c_SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL  : std_logic_vector(7 downto 0) := x"2A"; -- Init diag scroll
    constant c_SSD1306_DEACTIVATE_SCROLL                    : std_logic_vector(7 downto 0) := x"2E"; -- Stop scroll
    constant c_SSD1306_ACTIVATE_SCROLL                      : std_logic_vector(7 downto 0) := x"2F"; -- Start scroll
    constant c_SSD1306_SET_VERTICAL_SCROLL_AREA             : std_logic_vector(7 downto 0) := x"A3"; -- Set scroll range

end package;

package body ssd1306 is
end ssd1306;