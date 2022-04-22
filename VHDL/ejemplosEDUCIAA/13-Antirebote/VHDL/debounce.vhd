---------------------------------------------------------------------------
---- Entity:  debounce                                                 ----
---- Description: debouncing implemented with FSM                      ----
---- Author:  Martín A. Heredia                                        ----
---- Last revision: 05/08/2020                                         ----
---- Dependencies:                                                     ----
----   	 IEEE.std_logic_1164                                           ----
----	   IEEE.math_real                                                ----
----     IEEE.numeric_std                                              ----
----                                                                   ----
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity debounce is
generic(
    debounceTime : time := 10 ms; --debounceTime por defecto es 10 mseg
    clkFreqMhz : real := 1.0); --Frecuencia de clock en MHz, por defecto 1 MHz
port(
    btn_in : in std_logic;
    clk_in : in std_logic;
    rst_in_n : in std_logic;
    y_out : out std_logic);
end entity debounce;

architecture debounce_arch of debounce is
	  --Constantes--
    constant CLK_PER_NS : time := (1.0/clkFreqMhz)*1000 ns;
    constant M_COUNTS : integer := integer(ceil(real(debounceTime/CLK_PER_NS))); --Nº de cuentas para esperar
    constant N_BITS_CNTR : integer := integer(ceil(log2(real(M_COUNTS)))); --Nº bits del timer
		--Timer--
    signal timer_cnt : unsigned(N_BITS_CNTR downto 0);
		signal timer_rst : std_logic; --reset del timer
    signal timer_ena : std_logic; --enable del timer
    signal timerTc_s : std_logic; --terminal count del timer
		--FSM--
    type statesFSM is (idle_state, zero_state, wait_state, compare_state, one_state);
    signal currentState_s, nextState_s : statesFSM;
begin

		--Timer para esperar que pase el transitorio
		timer:
    process(clk_in)
    begin
		    if rising_edge(clk_in) then
			      if (timer_rst = '1') then
				        timerTc_s <= '0';
				        timer_cnt <= (others => '0');
			      elsif (timer_ena = '1') then
				        if  (timer_cnt = M_COUNTS - 1) then
					          timerTc_s <= '1';
				        else
					          timer_cnt <= timer_cnt + 1;
				        end if;
			      end if;
		    end if;
    end process timer;


    --Parte secuencial de la FSM
		sequential:
    process(clk_in,rst_in_n)
    begin
		    if (rst_in_n = '0') then
			      currentState_s <= idle_state;
		    elsif rising_edge(clk_in) then
			      currentState_s <= nextState_s;
		    end if;
    end process sequential;


    --Parte combinacional de la FSM
    combinational:
    process(btn_in,timerTc_s,currentState_s)
    begin
        case currentState_s is
			      when idle_state =>
				        timer_rst <= '1';
				        timer_ena <= '0';
				        y_out <= 'Z';
				        if (btn_in = '0') then
					          nextState_s <= zero_state;
				        elsif (btn_in = '1') then
					          nextState_s <= one_state;
                else
                    nextState_s <= idle_state;
				        end if;

			      when zero_state =>
						    timer_rst <= '1';
						    timer_ena <= '0';
				        y_out <= '0';
				        if (btn_in = '1') then
					          nextState_s <= wait_state;
                else
                    nextState_s <= zero_state;
                end if;

			      when one_state =>
						    timer_rst <= '1';
						    timer_ena <= '0';
				        y_out <= '1';
				        if (btn_in = '0') then
					          nextState_s <= wait_state;
                else
                    nextState_s <= one_state;
                end if;

			      when wait_state =>
				        timer_rst <= '0';
				        timer_ena <= '1';
				        if(timerTc_s = '1') then
					          nextState_s <= compare_state;
                else
                    nextState_s <= wait_state;
				        end if;

			      when compare_state =>
				        timer_rst <= '1';
				        timer_ena <= '0';
				        if(btn_in = '1') then
					          nextState_s <= one_state;
				        elsif(btn_in = '0') then
					          nextState_s <= zero_state;
                else
                    nextState_s <= idle_state;
				        end if;

			      when others =>
						    timer_rst <= '1';
						    timer_ena <= '0';
				        nextState_s <= idle_state;
		    end case;
    end process combinational;
end architecture debounce_arch;
