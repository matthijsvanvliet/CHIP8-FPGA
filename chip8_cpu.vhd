library ieee;
use ieee.std_logic_1164.all; -- For std_logic type definition
use ieee.numeric_std.all; -- For numerical computation (includes logical operations in this file (and, xor, etc))

entity chip8_cpu is
    port (
        -- clock
        i_clck          : in    std_logic;
        i_clck_100mhz   : in    std_logic;

        -- input keys
        i_keys      : in    std_logic_vector(0 to 15);

        -- output buffer
        o_buffer        : out   std_logic_vector(63 downto 0);
        o_buffer_sel    : out   std_logic_vector(4 downto 0)
    );
end chip8_cpu;

architecture arch_chip8_cpu of chip8_cpu is
    
    ---- Timing ----
    constant r_FREQ_CLOCK       : integer := 4_000_000; -- 4 MHz
    constant r_FREQ_60HZ_CLOCK  : integer := 60; -- 60 Hz
    constant r_FREQ_INSTR_CLOCK : integer := 500; -- Instruction speed -> How many instructions per second

    constant r_PRESCALER_60HZ       : integer := r_FREQ_CLOCK / r_FREQ_60HZ_CLOCK / 2; -- 4 MHz / 60 / 2 = 33333.333..
    signal r_PRESCALER_COUNTER_60HZ : integer := 0;

    constant r_PRESCALER_INSTR       : integer := r_FREQ_CLOCK / r_FREQ_INSTR_CLOCK / 2;
    signal r_PRESCALER_COUNTER_INSTR : integer := 0;
    ---- Timing ----

    ---- RAM module ----
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
    signal r_DELAY_TIMER : std_logic_vector(7 downto 0) := x"3c";--(others => '0');
    signal r_SOUND_TIMER : std_logic_vector(7 downto 0) := (others => '0');

    signal r_SET_DELAY_TIMER        : std_logic := '0';
    signal r_DELAY_TIMER_NEW_VALUE  : std_logic_vector(7 downto 0) := (others => '0');

    signal r_SET_SOUND_TIMER        : std_logic := '0';
    signal r_SOUND_TIMER_NEW_VALUE  : std_logic_vector(7 downto 0) := (others => '0');
    ---- Timers ----

    ---- Stack, SP, Registers, Program Counter and Current Instruction ----
    -- Stack
    constant c_STACK_WIDTH : integer := 16;
    type t_STACK is array (0 to c_STACK_WIDTH-1) of std_logic_vector(11 downto 0); -- Stack of 16 elements where each element is 12-bit
    signal r_STACK_DATA : t_STACK := (others => x"000");
    signal r_STACK_ADDR : std_logic_vector(11 downto 0) := x"000";

    -- SP
    signal r_SP : integer := 0;

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
    ---- Stack, Registers, Program Counter and Current Instruction ----

    ---- State Machine ----
    type t_SM_CPU is (
        s_NEXT_INSTR,
        s_FETCH_HIGH,
        s_FETCH_LOW,
        s_DECODE,
        s_STORE_CARRY,
        s_PUSH,
        s_POP,
        s_BCD1,
        s_BCD2,
        s_BCD3,
        s_STORE,
        s_LOAD
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
    constant c_DISPLAY_LENGTH   : integer := c_DISPLAY_WIDTH * c_DISPLAY_HEIGHT;

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

    MEMORY : entity work.chip8_memory
        port map (
            -- clock
            i_clck      => r_CLOCK,

            -- RAM
            i_data_in   => r_DATA_IN,
            i_address   => r_ADDRESS,
            i_en_write  => r_EN_WRITE,

            o_data_out  => w_DATA_OUT
        );

    p_MEMORY_CLOCK : process (i_clck) is
    begin
        r_CLOCK <= i_clck;
    end process p_MEMORY_CLOCK;

    p_DISPLAY_TO_OUTPUT_BUFFER : process (i_clck_100mhz) is
        variable v_SELECTION    : std_logic_vector(4 downto 0) := (others => '0');
    begin
        if rising_edge(i_clck_100mhz) then
            if to_integer(unsigned(v_SELECTION)) = (c_DISPLAY_HEIGHT - 1) then
                v_SELECTION := "00000";
            else
                v_SELECTION := std_logic_vector(unsigned(v_SELECTION) + 1);
            end if;

            o_buffer_sel <= v_SELECTION;
            o_buffer <= r_DISPLAY_BUFFER(to_integer(unsigned(v_SELECTION)));
        end if;
    end process p_DISPLAY_TO_OUTPUT_BUFFER;

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
            if r_SET_DELAY_TIMER = '1' then
                r_DELAY_TIMER <= r_DELAY_TIMER_NEW_VALUE;
            end if;

            if r_SET_SOUND_TIMER = '1' then
                r_SOUND_TIMER <= r_SOUND_TIMER_NEW_VALUE;
            end if;

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
    -- Memory variables
    variable v_RAM_CLKPULSE : std_logic := '0';

    -- BCD variable
    variable v_VX : integer := 0;

    -- Carry variable
    variable v_CARRY : std_logic_vector(7 downto 0) := (others => '0');

    -- Display variables
    variable v_SPRITE_COUNTER   : integer := 0;
    variable v_X_COOR           : integer := 0;
    variable v_Y_COOR           : integer := 0;
    variable v_SPRITE_BYTE      : std_logic_vector(7 downto 0) := (others => '0');

    -- Store variables
    variable v_UPPER_LIMIT          : integer := 0;
    variable v_LOADSTORE_COUNTER    : integer := 0;

    -- Keypad variables
    variable v_KEY_DOWN : std_logic := '0';
    begin
        if rising_edge(i_clck) then
            r_SEED <= (r_SEED * c_RAND_A + c_RAND_C) mod c_RAND_M;
            r_SET_DELAY_TIMER <= '0';

            case r_SM_CPU is
                when s_NEXT_INSTR =>
                    if r_PRESCALER_COUNTER_INSTR = r_PRESCALER_INSTR then
                        r_SM_CPU <= s_FETCH_HIGH;
                    end if;
                when s_FETCH_HIGH =>
                    r_EN_WRITE <= '0';
                    r_ADDRESS <= r_PROG_COUNT;
                    
                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
                        r_INSTRUCTION(15 downto 8) <= w_DATA_OUT;
                        r_SM_CPU <= s_FETCH_LOW;
                    end if;
                when s_FETCH_LOW =>
                    r_ADDRESS <= std_logic_vector(unsigned(r_PROG_COUNT) + 1);

                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
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
                when s_BCD1 =>
                    r_EN_WRITE <= '1';
                    r_ADDRESS <= std_logic_vector(unsigned(r_INDEX_REG) + 2);
                    r_DATA_IN <= std_logic_vector(to_unsigned(v_VX mod 10, r_DATA_IN'length));

                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
                        r_SM_CPU <= s_BCD2;
                    end if;
                when s_BCD2 =>
                    r_ADDRESS <= std_logic_vector(unsigned(r_INDEX_REG) + 1);
                    r_DATA_IN <= std_logic_vector(to_unsigned((v_VX / 10) mod 10, r_DATA_IN'length));

                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
                        r_SM_CPU <= s_BCD3;
                    end if;
                when s_BCD3 =>
                    r_ADDRESS <= std_logic_vector(unsigned(r_INDEX_REG));
                    r_DATA_IN <= std_logic_vector(to_unsigned(((v_VX / 10) / 10) mod 10, r_DATA_IN'length));

                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
                        r_SM_CPU <= s_NEXT_INSTR;
                    end if;
                when s_STORE =>
                    r_EN_WRITE <= '1';
                    r_ADDRESS <= std_logic_vector(unsigned(r_INDEX_REG) + v_LOADSTORE_COUNTER);
                    r_DATA_IN <= r_VAR_REG(v_LOADSTORE_COUNTER);

                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
                        if v_LOADSTORE_COUNTER + 1 > v_UPPER_LIMIT then
                            v_LOADSTORE_COUNTER := 0;
                            v_UPPER_LIMIT := 0;
                            r_SM_CPU <= s_NEXT_INSTR;
                        else
                            v_LOADSTORE_COUNTER := v_LOADSTORE_COUNTER + 1;
                        end if;
                    end if;
                when s_LOAD =>
                    r_EN_WRITE <= '0';
                    r_ADDRESS <= std_logic_vector(unsigned(r_INDEX_REG) + v_LOADSTORE_COUNTER);

                    if v_RAM_CLKPULSE = '0' then
                        v_RAM_CLKPULSE := '1';
                    else
                        v_RAM_CLKPULSE := '0';
                        if v_LOADSTORE_COUNTER > v_UPPER_LIMIT then
                            v_LOADSTORE_COUNTER := 0;
                            v_UPPER_LIMIT := 0;
                            r_SM_CPU <= s_NEXT_INSTR;
                        else
                            r_VAR_REG(v_LOADSTORE_COUNTER) <= w_DATA_OUT;
                            v_LOADSTORE_COUNTER := v_LOADSTORE_COUNTER + 1;
                        end if;
                    end if;
                when s_STORE_CARRY =>
                    r_VAR_REG(16#F#) <= v_CARRY;
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
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) = r_INSTRUCTION(7 downto 0) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"4" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) /= r_INSTRUCTION(7 downto 0) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"5" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) = r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))) then
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
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) + unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))))));
                                    if (to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) + to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))))))) > 255 then
                                        v_CARRY := x"01";
                                    else
                                        v_CARRY := x"00";
                                    end if;
                                    r_SM_CPU <= s_STORE_CARRY;
                                when x"5" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) - unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))))));
                                    if to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))))) > to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) then
                                        v_CARRY := x"00";
                                    else
                                        v_CARRY := x"01";
                                    end if;
                                    r_SM_CPU <= s_STORE_CARRY;
                                when x"6" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(shift_right(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))), 1));
                                    if (r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) and x"01") = x"01" then
                                        v_CARRY := x"01";
                                    elsif (r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) and x"01") = x"00" then
                                        v_CARRY := x"00";
                                    end if;
                                    r_SM_CPU <= s_STORE_CARRY;
                                when x"7" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4))))) - unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))));
                                    if to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) > to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))))) then
                                        v_CARRY := x"00";
                                    else
                                        v_CARRY := x"01";
                                    end if;
                                    r_SM_CPU <= s_STORE_CARRY;
                                when x"E" =>
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(shift_left(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))), 1));
                                    if (r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) and x"80") = x"80" then
                                        v_CARRY := x"01";
                                    elsif (r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) and x"80") = x"00" then
                                        v_CARRY := x"00";
                                    end if;
                                    r_SM_CPU <= s_STORE_CARRY;
                                when others => NULL;
                            end case;
                        when x"9" =>
                            if r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) /= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(7 downto 4)))) then
                                r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                            end if;
                        when x"A" =>
                            r_INDEX_REG <= r_INSTRUCTION(11 downto 0);
                        when x"B" =>
                            r_PROG_COUNT <= std_logic_vector(unsigned(r_INSTRUCTION(11 downto 0)) + to_integer(unsigned(r_VAR_REG(0))));
                        when x"C" =>
                            r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(unsigned(r_INSTRUCTION(7 downto 0))) and std_logic_vector(to_unsigned(r_SEED, 8));
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

                                    if v_RAM_CLKPULSE = '0' then
                                        v_RAM_CLKPULSE := '1';
                                    else
                                        v_RAM_CLKPULSE := '0';
                                        v_SPRITE_BYTE := w_DATA_OUT;
                                        r_SM_DRAW <= s_PROCESS_SPRITE;
                                    end if;
                                when s_PROCESS_SPRITE =>
                                    if v_SPRITE_COUNTER < to_integer(unsigned(r_INSTRUCTION(3 downto 0))) then
                                        v_SPRITE_COUNTER := v_SPRITE_COUNTER + 1;
                                        for i in 0 to v_SPRITE_BYTE'length - 1 loop
                                            if (c_DISPLAY_WIDTH - 1 - v_X_COOR - i) >= 0 then
                                                if (r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - 1 - v_X_COOR - i) and v_SPRITE_BYTE(v_SPRITE_BYTE'length - 1 - i)) = '1' then
                                                    r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - 1 - v_X_COOR - i) <= r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - 1 - v_X_COOR - i) xor v_SPRITE_BYTE(v_SPRITE_BYTE'length - 1 - i);
                                                    r_VAR_REG(16#F#) <= x"01";
                                                else
                                        	        r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - 1 - v_X_COOR - i) <= r_DISPLAY_BUFFER(v_Y_COOR)(c_DISPLAY_WIDTH - 1 - v_X_COOR - i) xor v_SPRITE_BYTE(v_SPRITE_BYTE'length - 1 - i);
                                                end if;
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
                        when x"E" =>
                            case r_INSTRUCTION(7 downto 0) is
                                when x"9E" =>
                                    if i_keys(to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))))) = '1' then
                                        r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                                    end if;
                                when x"A1" =>
                                    if i_keys(to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))))) = '0' then
                                        r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) + 2);
                                    end if;
                                when others => NULL;
                            end case;
                        when x"F" =>
                            case r_INSTRUCTION(7 downto 0) is
                                when x"07" =>
                                    -- VX = Delay Timer
                                    r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= r_DELAY_TIMER;
                                when x"0A" => 
                                    -- Wait until key is pressed
                                    if i_keys = x"0000" then
                                        r_PROG_COUNT <= std_logic_vector(unsigned(r_PROG_COUNT) - 2);
                                    else
                                        for i in 0 to i_keys'length - 1 loop
                                            if i_keys(i) = '1' then
                                                r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))) <= std_logic_vector(to_unsigned(i, r_VAR_REG(0)'length));
                                            end if;
                                        end loop;
                                    end if;                                        
                                when x"15" =>
                                    -- Delay Timer = VX
                                    r_DELAY_TIMER_NEW_VALUE <= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))));
                                    r_SET_DELAY_TIMER <= '1';
                                when x"18" =>
                                    -- Sound Timer = VX
                                    r_SOUND_TIMER_NEW_VALUE <= r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))));
                                    r_SET_SOUND_TIMER <= '1';
                                when x"1E" =>
                                    -- I = I + VX
                                    r_INDEX_REG <= std_logic_vector(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))) + unsigned(r_INDEX_REG));
                                when x"29" =>
                                    -- Font Location => 0x050 --> I = 0x050 + (VX * 5)
                                    r_INDEX_REG <= std_logic_vector(x"050" + to_unsigned(to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8)))))) * 5, r_INDEX_REG'length)); 
                                when x"33" =>
                                    v_VX := to_integer(unsigned(r_VAR_REG(to_integer(unsigned(r_INSTRUCTION(11 downto 8))))));
                                    r_SM_CPU <= s_BCD1;
                                when x"55" =>
                                    v_UPPER_LIMIT := to_integer(unsigned(r_INSTRUCTION(11 downto 8)));
                                    r_SM_CPU <= s_STORE;
                                when x"65" =>
                                    v_UPPER_LIMIT := to_integer(unsigned(r_INSTRUCTION(11 downto 8)));
                                    r_SM_CPU <= s_LOAD;
                                when others => NULL;
                            end case;
                        when others => NULL;
                    end case;
                when others =>
                    r_SM_CPU <= s_NEXT_INSTR;
            end case;
        end if;
    end process p_STATE_MACHINE;
    
end arch_chip8_cpu;
