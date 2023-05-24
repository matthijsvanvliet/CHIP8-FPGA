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
    
    ---- Timing ----
    constant r_FREQ_CLOCK       : integer := 4000000; -- 4 MHz
    constant r_FREQ_60HZ_CLOCK  : integer := 60; -- 60 Hz
    constant r_FREQ_INSTR_CLOCK : integer := 700; -- 700 Hz

    constant r_PRESCALER_60HZ       : integer := r_FREQ_CLOCK / r_FREQ_60HZ_CLOCK / 2; -- 4 MHz / 60 / 2 = 33333.333..
    signal r_PRESCALER_COUNTER_60HZ : integer := 0;

    constant r_PRESCALER_INSTR       : integer := r_FREQ_CLOCK / r_FREQ_INSTR_CLOCK / 2;
    signal r_PRESCALER_COUNTER_INSTR : integer := 0;
    ---- Timing ----

    ---- RAM module ----
    -- Memory of the CHIP8 that consists of 4kB (4096 bytes)
    component chip8_memory
        port (
            -- clock
            i_clck      : in    std_logic;

            -- RAM
            i_data_in   : in    std_logic_vector(7 downto 0);
            i_address   : in    std_logic_vector(11 downto 0);
            i_en_write  : in    std_logic;

            o_data_out  : out   std_logic_vector(7 downto 0)
        );
    end component chip8_memory;

    -- Clock signals
    signal r_CLOCK  : std_logic := '0';

    -- RAM signals
    signal r_DATA_IN    : std_logic_vector(7 downto 0) := (others => '0');
    signal r_ADDRESS    : std_logic_vector(11 downto 0) := (others => '0');
    signal r_EN_WRITE   : std_logic := '0';

    signal w_DATA_OUT   : std_logic_vector(7 downto 0);
    ---- RAM module ----

    ---- Timers ----
    -- Timers that are decremented 60 times per second. Consists of a delay timer and a sound timer
    signal r_DELAY_TIMER : std_logic_vector(7 downto 0) := (others => '0');
    signal r_SOUND_TIMER : std_logic_vector(7 downto 0) := (others => '0');
    ---- Timers ----

    ---- Stack, Registers, Program Counter and Current Instruction ----
    -- Stack
    constant c_STACK_WIDTH : integer := 16;
    type t_STACK is array (0 to c_STACK_WIDTH-1) of std_logic_vector(15 downto 0); -- Stack of 16 elements where each element is 16-bit
    signal r_STACK_DATA : t_STACK := (others => x"0000");

    -- General Purpose Variable Registers
    constant c_V_WIDTH : integer := 16;
    type t_VAR_REG is array (0 to c_V_WIDTH-1) of std_logic_vector(7 downto 0); -- 16 8-bit general-purpose variable registers
    signal r_VAR_REG : t_VAR_REG := (others => x"00");

    -- Index Register
    signal r_INDEX_REG : std_logic_vector(15 downto 0) := (others => '0');

    -- Program Counter
    signal r_PROG_COUNT : std_logic_vector(11 downto 0) := x"050"; --(others => '0');

    -- Current Instruction
    signal r_INSTRUCTION : std_logic_vector(15 downto 0) := (others => '0');
    ---- Stack, Registers, Program Counter and Current Instruction ----

    ---- State Machine ----
    type t_SM_CPU is (
        s_NEXT_INSTR,
        s_FETCH_HIGH,
        s_FETCH_LOW,
        s_INCR_PC,
        s_DECODE
    );
    signal r_SM_CPU : t_SM_CPU := s_NEXT_INSTR;
    ---- State Machine ----
                                                    
begin

    MEMORY : chip8_memory
        port map (
            -- clock
            i_clck      => r_CLOCK,

            -- RAM
            i_data_in   => r_DATA_IN,
            i_address   => r_ADDRESS,
            i_en_write  => r_EN_WRITE,

            o_data_out  => w_DATA_OUT
        );

    p_CLOCK : process (i_clck) is
    begin
        r_CLOCK <= i_clck;
    end process p_CLOCK;

    p_PRESCALAR_COUNTER : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            -- 60 Hz Counter
            if r_PRESCALER_COUNTER_60HZ = r_PRESCALER_60HZ then
                r_PRESCALER_COUNTER_60HZ <= 0;
            else
                r_PRESCALER_COUNTER_60HZ <= r_PRESCALER_COUNTER_60HZ + 1;
            end if;

            -- Instruction Counter (700 Hz)
            if r_PRESCALER_COUNTER_INSTR = r_PRESCALER_INSTR then
                r_PRESCALER_COUNTER_INSTR <= 0;
            else
                r_PRESCALER_COUNTER_INSTR <= r_PRESCALER_COUNTER_INSTR + 1;
            end if;
        end if;
    end process p_PRESCALAR_COUNTER;

    p_DECR_TIMERS : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            if r_PRESCALER_COUNTER_60HZ = r_PRESCALER_60HZ then
                if unsigned(r_DELAY_TIMER) > 0 then
                    r_DELAY_TIMER <= std_logic_vector(unsigned(r_DELAY_TIMER) - 1);
                end if;

                if unsigned(r_SOUND_TIMER) > 0 then
                    r_SOUND_TIMER <= std_logic_vector(unsigned(r_SOUND_TIMER) - 1);
                end if;
            end if;
        end if;
    end process p_DECR_TIMERS;

    p_STATE_MACHINE : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            case r_SM_CPU is
                when s_NEXT_INSTR =>
                    if r_PRESCALER_COUNTER_INSTR = r_PRESCALER_INSTR then
                        r_SM_CPU <= s_FETCH_HIGH;
                    end if;
                when s_FETCH_HIGH =>
                    r_EN_WRITE <= '0';
                    r_ADDRESS <= r_PROG_COUNT;
                    r_INSTRUCTION(15 downto 8) <= w_DATA_OUT;
                    r_SM_CPU <= s_FETCH_LOW;
                when s_FETCH_LOW =>
                    r_ADDRESS <= std_logic_vector(unsigned(r_PROG_COUNT) + 1);
                    r_INSTRUCTION(7 downto 0) <= w_DATA_OUT;
                    r_SM_CPU <= s_INCR_PC;
                when s_INCR_PC =>
                    r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                    r_SM_CPU <= s_DECODE;
                when s_DECODE =>
                    case r_INSTRUCTION(15 downto 12) is
                        when x"0" =>
                            case r_INSTRUCTION(11 downto 0) is
                                when x"0E0" =>

                                when others =>
                                    r_SM_CPU <= s_NEXT_INSTR;
                            end case;
                        when x"1" =>
                            -- implement
                        when x"2" =>
                            -- implement
                        when x"3" =>
                            -- implement
                        when x"4" =>
                            -- implement
                        when x"5" =>
                            -- implement
                        when x"6" =>
                            -- implement
                        when x"7" =>
                            -- implement
                        when x"8" =>
                            -- implement
                        when x"9" =>
                            -- implement
                        when x"A" =>
                            -- implement
                        when x"B" =>
                            -- implement
                        when x"C" =>
                            -- implement
                        when x"D" =>
                            -- implement
                        when x"E" =>
                            -- implement
                        when x"F" =>
                            -- implement
                        when others =>
                            r_SM_CPU <= s_NEXT_INSTR;
                    end case;
                when others =>
                    r_SM_CPU <= s_NEXT_INSTR;
            end case;
        end if;
    end process p_STATE_MACHINE;
    
end arch_chip8_cpu;
