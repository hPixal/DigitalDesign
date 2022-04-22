---------------------------------------------------------------------------
---- Entity: debounce_tb_oneToZero                                    ----
---- Description: Testbench for specified stimulus file                ----
---- Author: Martin A. Heredia                                         ----
---- Last revision: 05/08/2020                                         ----
---- Dependencies:                                                     ----
----     IEEE.std_logic_1164	                                         ----
----	   IEEE.std_logic_textio                                         ----
----        This last dependency requires '-fsynopsys' option          ----
----        of GHDL                                                    ----
----    IEEE.numeric_std                                               ----
----    std.textio                                                     ----
----    work.parametersPackage                                         ----
----	                                                                 ----
----                                                                   ----
----                                                                   ----
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;
library std;
use std.textio.all;
library work;
use work.parametersPackage.all;

entity debounce_tb_oneToZero is
end entity debounce_tb_oneToZero;

architecture debounce_tb_oneToZero_arch of debounce_tb_oneToZero is
    signal done_s : boolean := FALSE;
		constant STIMULUS_FILE : string := "stimulus/stim_zero_to_one.txt"; --Archivo de estímulos
    constant PER2 : time := (1.0/(2.0*F_CLOCK_MHZ)) * 1 us;
    signal test_btn_in : std_logic;
		signal test_clk_in : std_logic;
		signal test_rst_in_n : std_logic;
		signal test_y_out : std_logic;
    signal tCount_cnt : unsigned(7 downto 0) := (others => '0'); --Contador de transiciones en test_y_out
    signal tCount_ena : std_logic := '0'; --Habilitación del contador de transiciones
begin

    DUT: entity work.debounce
        generic map(debounceTime => DEBOUNCE_TIME, clkFreqMhz => F_CLOCK_MHZ)
        port map(
            btn_in => test_btn_in,
            rst_in_n => test_rst_in_n,
            clk_in => test_clk_in,
            y_out => test_y_out);


    --Contar transiciones en test_y_out
    count_transitions:
    process(test_y_out)
    begin
        if(tCount_ena = '1') then
            tCount_cnt <= tCount_cnt + 1;
        end if;
    end process count_transitions;


    --Generar clock
		do_clock:
	  process
	  begin
		    test_clk_in <= '0';
		    wait for PER2;
		    test_clk_in <= '1';
		    wait for PER2;
		    if done_s then
			      wait;
		    end if;
    end process do_clock;

    --Leer estimulos
		stimulus:
	  process
	      file F : text;
	      variable buff : line;
				variable monitor : line; --para escribir en la salida estandar
				variable sl_buff : std_logic;
        variable t_buff : time;
	  begin
		 	  --Comienzo del testbench
	      report "Start Testbench";
				--reset
        report "Reset";
				test_rst_in_n <= '0';
        test_btn_in <= '0';
		    wait for 8*PER2;
		    test_rst_in_n <= '1';
				--Leer estimulos
				report "Reading stimulus file";
		    file_open(F,STIMULUS_FILE,read_mode);
				readline(F,buff);
				read(buff,t_buff);
				write(monitor,t_buff);
   		 writeline(OUTPUT,monitor);
		    while not endfile(F) loop
			      readline(F, buff);
			      read(buff, sl_buff);
			      test_btn_in <= not (sl_buff);
			      wait for t_buff; --tiempo entre muestras
            tCount_ena <= '1';
            assert (tCount_cnt < 2)
            report "More than one transition registered in output signal y" severity failure;
		    end loop;
		    file_close(F);
        report "Test finished OK!";
		    done_s <= TRUE;
		    wait;
    end process stimulus;

end architecture debounce_tb_oneToZero_arch;
