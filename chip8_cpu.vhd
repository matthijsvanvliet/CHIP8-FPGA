library ieee;
use ieee.std_logic_1164.all; -- For std_logic type definition
use ieee.numeric_std.all; -- For numerical computation (includes logical operations in this file (and, xor, etc))

entity chip8_cpu is
    port (
        -- clock
        i_clck      : in    std_logic
    );
end chip8_cpu;

architecture arch_chip8_cpu of chip8_cpu is
    
    -- RAM module
    component chip8_memory
        port (
            -- clock
            i_clck      : in    std_logic;

            -- RAM
            i_data_in   : in    std_logic_vector(7 downto 0);
            i_address   : in    std_logic_vector(11 downto 0);
            i_en_write  : in    std_logic;

            o_data_out  : out   std_logic_vector(7 downto 0);
            o_read_done : out   std_logic
        );
    end component chip8_memory;

    -- Clock signals
    signal r_CLOCK  : std_logic := '0';

    -- RAM signals
    signal r_DATA_IN    : std_logic_vector(7 downto 0) := (others => '0');
    signal r_ADDRESS    : std_logic_vector(11 downto 0) := (others => '0');
    signal r_EN_WRITE   : std_logic := '0';

    signal w_DATA_OUT   : std_logic_vector(7 downto 0);
    signal w_READ_DONE  : std_logic;

    signal w_READ_DATA  : std_logic_vector(7 downto 0);
                                                    
begin

    MEMORY : chip8_memory
        port map (
            -- clock
            i_clck      => r_CLOCK,

            -- RAM
            i_data_in   => r_DATA_IN,
            i_address   => r_ADDRESS,
            i_en_write  => r_EN_WRITE,

            o_data_out  => w_DATA_OUT,
            o_read_done => w_READ_DONE
        );

    p_CLOCK : process (i_clck) is
    begin
        r_CLOCK <= i_clck;
    end process p_CLOCK;
    
end arch_chip8_cpu;
