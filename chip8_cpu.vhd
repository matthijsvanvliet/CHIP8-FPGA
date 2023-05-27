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

    ---- Stack, Registers, Program Counter, Current Instruction and SP ----
    -- Stack
    constant c_STACK_WIDTH : integer := 16;
    type t_STACK is array (0 to c_STACK_WIDTH-1) of std_logic_vector(15 downto 0); -- Stack of 16 elements where each element is 16-bit
    signal r_STACK_DATA : t_STACK := (others => x"0000");
    signal r_STACK_ADDR : std_logic_vector(11 downto 0) := x"000";

    -- General Purpose Variable Registers
    constant c_V_WIDTH : integer := 16;
    type t_VAR_REG is array (0 to c_V_WIDTH-1) of std_logic_vector(7 downto 0); -- 16 8-bit general-purpose variable registers
    signal r_VAR_REG : t_VAR_REG := (others => x"00");

    -- Index Register
    signal r_INDEX_REG : std_logic_vector(11 downto 0) := (others => '0');

    -- Program Counter
    signal r_PROG_COUNT : std_logic_vector(11 downto 0) := x"200";

    -- Current Instruction
    signal r_INSTRUCTION : std_logic_vector(15 downto 0) := (others => '0');

    -- SP
    signal r_SP : integer := 0;
    ---- Stack, Registers, Program Counter and Current Instruction ----

    ---- State Machine ----
    type t_SM_CPU is (
        s_NEXT_INSTR,
        s_FETCH_HIGH,
        s_FETCH_LOW,
        s_INCR_PC,
        s_DECODE,
        s_PUSH,
        s_POP
    );
    signal r_SM_CPU : t_SM_CPU := s_NEXT_INSTR;

    type t_SM_DRAW is (
        s_INIT,
        s_LOAD_SPRITE,
        s_PROCESS_SPRITE,
        s_INCR_Y
    );
    signal r_SM_DRAW : t_SM_DRAW := s_INIT;
    ---- State Machine ----

    ---- Display ----
    constant c_DISPLAY_WIDTH    : integer := 64;
    constant c_DISPLAY_HEIGHT   : integer := 32;

    type t_DISPLAY_BUFFER is array (0 to c_DISPLAY_HEIGHT-1) of std_logic_vector(c_DISPLAY_WIDTH-1 downto 0);
    signal r_DISPLAY_BUFFER : t_DISPLAY_BUFFER := (others => x"0000_0000_0000_0000");
    ---- Display ----

    ---- Random ----
    constant c_RAND_A : integer := 1103515245;
    constant c_RAND_C : integer := 12345;
    constant c_RAND_M : integer := 2147483647;

    signal r_SEED : integer := 16#B16B00B#;
    ---- Random ----

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
    variable v_READ_RAM : std_logic := '0';

    -- Display variables
    variable v_SPRITE_COUNTER   : integer := 0;
    variable v_X_COOR           : integer := 0;
    variable v_Y_COOR           : integer := 0;
    variable v_SPRITE_BYTE      : std_logic_vector(7 downto 0) := (others => '0');
    begin
        if rising_edge(i_clck) then
            r_SEED <= (r_SEED * c_RAND_A + c_RAND_C) mod c_RAND_M;

            case r_SM_CPU is
                when s_NEXT_INSTR =>
                    if r_PRESCALER_COUNTER_INSTR = r_PRESCALER_INSTR then
                        r_SM_CPU <= s_FETCH_HIGH;
                    end if;
                when s_FETCH_HIGH =>
                    r_EN_WRITE <= '0';
                    r_ADDRESS <= r_PROG_COUNT;
                    
                    if v_READ_RAM = '0' then
                        v_READ_RAM := '1';
                    else
                        v_READ_RAM := '0';
                        r_INSTRUCTION(15 downto 8) <= w_DATA_OUT;
                        r_SM_CPU <= s_FETCH_LOW;
                    end if;
                when s_FETCH_LOW =>
                    r_ADDRESS <= std_logic_vector(unsigned(r_PROG_COUNT) + 1);

                    if v_READ_RAM = '0' then
                        v_READ_RAM := '1';
                    else
                        v_READ_RAM := '0';
                        r_INSTRUCTION(7 downto 0) <= w_DATA_OUT;
                        r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                        r_SM_CPU <= s_DECODE;
                    end if;
                when s_PUSH =>
                    r_SP <= r_SP + 1;
                    r_PROG_COUNT <= r_STACK_ADDR;
                    r_SM_CPU <= s_NEXT_INSTR;
                when s_POP =>
                    r_PROG_COUNT <= r_STACK_DATA(r_SP);
                    r_SM_CPU <= s_NEXT_INSTR;
                when s_DECODE =>
                    r_SM_CPU <= s_NEXT_INSTR;

                    case r_INSTRUCTION(15 downto 12) is
                        when x"0" =>
                            case r_INSTRUCTION(11 downto 0) is
                                when x"0E0" =>
                                    r_DISPLAY_BUFFER <= (others => x"0000_0000_0000_0000");
                                when x"0EE" =>
                                    r_SP <= r_SP - 1;
                                    r_SM_CPU <= s_POP;
                                when others => NULL;
                            end case;
                        when x"1" =>
                            r_PROG_COUNT <= r_INSTRUCTION(11 downto 0);
                        when x"2" =>
                            r_STACK_DATA(r_SP) <= r_PROG_COUNT;
                            r_STACK_ADDR <= r_INSTRUCTION(11 downto 0);
                            r_SM_CPU <= s_PUSH;
                        when x"3" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) = r_INSTRUCTION(78 downto 0) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"4" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) /= r_INSTRUCTION(78 downto 0) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"5" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) = r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 3)))) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"6" =>
                            r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= r_INSTRUCTION(7 downto 0);
                        when x"7" =>
                            r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) + unsigned(r_INSTRUCTION(7 downto 0)));
                        when x"8" =>
                            case r_INSTRUCTION(3 downto 0) is
                                when x"0" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))));
                                when x"1" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) or r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))));
                                when x"2" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) and r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))));
                                when x"3" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) xor r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))));
                                when x"4" =>
                                    if to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) + unsigned(r_INSTRUCTION(7 downto 0))) > 255 then
                                        r_VAR_REG(16#F#) <= x"01";
                                    end if;
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) + unsigned(r_INSTRUCTION(7 downto 0)));
                                when x"5" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) - unsigned(r_INSTRUCTION(7 downto 0)));
                                    if to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) > to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))))) then
                                        r_VAR_REG(16#F#) <= x"01";
                                    else
                                        r_VAR_REG(16#F#) <= x"00";
                                    end if;
                                when x"6" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(shift_right(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))), 1));
                                    if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) & x"01" = x"01" then
                                        r_VAR_REG(16#F#) <= x"01";
                                    elsif r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) & x"01" = x"00" then
                                        r_VAR_REG(16#F#) <= x"00";
                                    end if;
                                when x"7" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))))) - unsigned(r_INSTRUCTION(11 downto 8)));
                                    if to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))))) > to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) then
                                        r_VAR_REG(16#F#) <= x"01";
                                    else
                                        r_VAR_REG(16#F#) <= x"00";
                                    end if;
                                when x"E" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(shift_left(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))), 1));
                                    if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) & x"01" = x"01" then
                                        r_VAR_REG(16#F#) <= x"01";
                                    elsif r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) & x"01" = x"00" then
                                        r_VAR_REG(16#F#) <= x"00";
                                    end if;
                                when others => NULL;
                            end case;
                        when x"9" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) /= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 3)))) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"A" =>
                            r_INDEX_REG <= r_INSTRUCTION(11 downto 0);
                        when x"B" => 
                            r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + to_integer(unsigned(r_VAR_REG(0))));
                        when x"C" =>
                            r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_INSTRUCTION(11 downto 8))) & std_logic_vector(to_unsigned(r_SEED, 8));
                        when x"D" =>
                            r_SM_CPU <= s_DECODE;
                            
                            case r_SM_DRAW is
                                when s_INIT =>
                                    v_X_COOR := to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) mod (c_DISPLAY_WIDTH - 1);
                                    v_Y_COOR := to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))))) mod (c_DISPLAY_HEIGHT - 1);

                                    v_SPRITE_COUNTER := 0;
                                    r_VAR_REG(16#F#) <= x"00";
                                    r_SM_DRAW <= s_LOAD_SPRITE;
                                when s_LOAD_SPRITE =>
                                    r_ADDRESS <= std_logic_vector(unsigned(r_INDEX_REG) + v_SPRITE_COUNTER);

                                    if v_READ_RAM = '0' then
                                        v_READ_RAM := '1';
                                    else
                                        v_READ_RAM := '0';
                                        v_SPRITE_BYTE := w_DATA_OUT;
                                        r_SM_DRAW <= s_PROCESS_SPRITE;
                                    end if;
                                when s_PROCESS_SPRITE =>
                                    if v_SPRITE_COUNTER < to_integer(unsigned(r_INSTRUCTION(3 downto 0))) then
                                        v_SPRITE_COUNTER := v_SPRITE_COUNTER + 1;
                                        for i in 0 to v_SPRITE_BYTE'length - 1 loop
                                            if (c_DISPLAY_WIDTH - v_X_COOR - i) > 0 then
                                                if v_SPRITE_BYTE(v_SPRITE_BYTE'length - 1 - i) = r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - v_X_COOR - i) then
                                                    r_VAR_REG(16#F#) <= x"01";
                                                end if;
                                            
                                                r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - v_X_COOR - i) <= r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - v_X_COOR - i) xor v_SPRITE_BYTE(v_SPRITE_BYTE'length - 1 - i);
                                            end if;
                                        end loop;
                                        r_SM_DRAW <= s_INCR_Y;
                                    else
                                        r_SM_DRAW <= s_INIT;
                                        r_SM_CPU <= s_NEXT_INSTR;
                                    end if;
                                when s_INCR_Y =>
                                    if v_Y_COOR < c_DISPLAY_HEIGHT - 1 then
                                        v_Y_COOR := v_Y_COOR + 1;
                                        r_SM_DRAW <= s_LOAD_SPRITE;
                                    else
                                        r_SM_DRAW <= s_INIT;
                                        r_SM_CPU <= s_NEXT_INSTR;
                                    end if;
                                when others => NULL;
                            end case;
                        when others => 
                            r_SM_CPU <= s_NEXT_INSTR;
                    end case;
                when others =>
                    r_SM_CPU <= s_NEXT_INSTR;
            end case;
        end if;
    end process p_STATE_MACHINE;
    
end arch_chip8_cpu;
