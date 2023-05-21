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
    
    -- RAM module --
    -- Memory of the CHIP8 that consists of 4kB (4096 bytes)
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

    signal r_PRESCALER          : integer := 33333; -- 4 MHz / 60 / 2 = 33333.333..
    signal r_PRESCALER_COUNTER  : integer := 0;

    -- RAM signals
    signal r_DATA_IN    : std_logic_vector(7 downto 0) := (others => '0');
    signal r_ADDRESS    : std_logic_vector(11 downto 0) := (others => '0');
    signal r_EN_WRITE   : std_logic := '0';

    signal w_DATA_OUT   : std_logic_vector(7 downto 0);
    signal w_READ_DONE  : std_logic;

    signal w_READ_DATA  : std_logic_vector(7 downto 0);
    -- RAM module --

    -- Timers --
    -- Timers that are decremented 60 times per second. Consists of a delay timer and a sound timer
    signal r_DELAY_TIMER : std_logic_vector(7 downto 0);
    signal r_SOUND_TIMER : std_logic_vector(7 downto 0);
    -- Timers --

    -- Stack, Registers and Program Counter --
    -- Stack
    constant c_STACK_WIDTH : integer := 16;
    type t_STACK is array (0 to c_STACK_WIDTH-1) of std_logic_vector(15 downto 0); -- Stack of 16 elements where each element is 16-bit
    signal r_STACK_DATA : t_STACK;

    -- General Purpose Variable Registers
    constant c_V_WIDTH : integer := 16;
    type t_VAR_REG is array (0 to c_V_WIDTH-1) of std_logic_vector(7 downto 0); -- 16 8-bit general-purpose variable registers
    signal r_VAR_REG : t_VAR_REG;

    -- Index Register
    signal r_INDEX_REG : std_logic_vector(15 downto 0);

    -- Program Counter
    signal r_PROG_COUNT : std_logic_vector(15 downto 0);
    -- Registers, Stack and Program Counter -- 

    -- State Machine --
    type t_SM_CPU is (
        s_NEXT,
        s_FETCH,
        s_DECODE,
        s_EXECUTE
    );
    signal r_SM_CPU : t_SM_CPU := s_NEXT;
    -- State Machine --
                                                    
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

    p_PRESCALAR_COUNTER : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            if r_PRESCALER_COUNTER = r_PRESCALER then
                r_PRESCALER_COUNTER <= 0;
            else
                r_PRESCALER_COUNTER <= r_PRESCALER_COUNTER + 1;
            end if;
        end if;
    end process p_PRESCALAR_COUNTER;

    p_DECR_DELAY_TIMER : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            if r_PRESCALER_COUNTER = r_PRESCALER then
                if unsigned(r_DELAY_TIMER) > 0 then
                    r_DELAY_TIMER <= std_logic_vector(unsigned(r_DELAY_TIMER) - 1);
                end if;
            end if;
        end if;
    end process p_DECR_DELAY_TIMER;

    p_DECR_SOUND_TIMER : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            if r_PRESCALER_COUNTER = r_PRESCALER then
                if unsigned(r_SOUND_TIMER) > 0 then
                    r_SOUND_TIMER <= std_logic_vector(unsigned(r_SOUND_TIMER) - 1);
                end if;
            end if;
        end if;
    end process p_DECR_SOUND_TIMER;
    
end arch_chip8_cpu;
