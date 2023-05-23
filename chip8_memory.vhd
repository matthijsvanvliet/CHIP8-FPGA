library ieee;
use ieee.std_logic_1164.all; -- For std_logic type definition
use ieee.numeric_std.all; -- For numerical computation (includes logical operations in this file (and, xor, etc))

entity chip8_memory is
    port (
        -- clock
        i_clck      : in    std_logic;

        -- RAM
        i_data_in   : in    std_logic_vector(7 downto 0);
        i_address   : in    std_logic_vector(11 downto 0);
        i_en_write  : in    std_logic;

        o_data_out  : out   std_logic_vector(7 downto 0)
    );
end chip8_memory;

architecture arch_chip8_memory of chip8_memory is

    -- Font
    constant c_FONT_WIDTH : integer := 80;

    type t_FONT is array (0 to c_FONT_WIDTH-1) of std_logic_vector(7 downto 0);
    signal r_FONT_DATA : t_FONT := (
        x"F0", x"90", x"90", x"90", x"F0", -- 0
        x"20", x"60", x"20", x"20", x"70", -- 1
        x"F0", x"10", x"F0", x"80", x"F0", -- 2
        x"F0", x"10", x"F0", x"10", x"F0", -- 3
        x"90", x"90", x"F0", x"10", x"10", -- 4
        x"F0", x"80", x"F0", x"10", x"F0", -- 5
        x"F0", x"80", x"F0", x"90", x"F0", -- 6
        x"F0", x"10", x"20", x"40", x"40", -- 7
        x"F0", x"90", x"F0", x"90", x"F0", -- 8
        x"F0", x"90", x"F0", x"10", x"F0", -- 9
        x"F0", x"90", x"F0", x"90", x"90", -- A
        x"E0", x"90", x"E0", x"90", x"E0", -- B
        x"F0", x"80", x"80", x"80", x"F0", -- C
        x"E0", x"90", x"90", x"90", x"E0", -- D
        x"F0", x"80", x"F0", x"80", x"F0", -- E
        x"F0", x"80", x"F0", x"80", x"80"  -- F
    );

    constant c_FONT_LOC   : integer   := 80; 

    -- RAM data
    constant c_RAM_WIDTH : integer := 4096;

    type t_RAM is array (0 to c_RAM_WIDTH-1) of std_logic_vector(7 downto 0);

    function InitialiseRamWithFont(
            signal font_data : in t_FONT
        )
        return t_RAM is variable ram_data : t_RAM;
    begin
        ram_data := (others => x"00");
        for i in t_FONT'range loop
            ram_data(80 + i) := font_data(i); -- Load font data to address 0x050
        end loop;
        return ram_data;
    end InitialiseRamWithFont;

    signal r_RAM_DATA : t_RAM := InitialiseRamWithFont(r_FONT_DATA);

begin

    p_RAM : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            if i_en_write = '1' then
                r_RAM_DATA(to_integer(unsigned(i_address))) <= i_data_in;
            end if;
        end if;
        o_data_out <= r_RAM_DATA(to_integer(unsigned(i_address)));
    end process p_RAM;
    
end arch_chip8_memory;