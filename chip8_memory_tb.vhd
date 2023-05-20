library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chip8_memory_tb is
end chip8_memory_tb;

architecture behave of chip8_memory_tb is

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

    DUT : chip8_memory
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

    p_CLOCK : process
    begin
        r_CLOCK <= not r_CLOCK;
        wait for 5 ns;
    end process p_CLOCK;

    process is
    begin
        -- Write 0xFF to address 0x010
        r_ADDRESS <= x"010";
        r_EN_WRITE <= '1';
        r_DATA_IN <= x"FF";

        wait for 10 ns;

        r_EN_WRITE <= '0';
        
        -- Write 0xFA to address 0x011
        r_ADDRESS <= x"011";
        r_EN_WRITE <= '1';
        r_DATA_IN <= x"FA";

        wait for 10 ns;

        -- Read from address 0x010
        r_EN_WRITE <= '0';
        r_ADDRESS <= x"010";

        wait until w_READ_DONE = '1';

        w_READ_DATA <= w_DATA_OUT;

        wait for 1 ms;

    end process;

end behave;