---------------------------------------------------------------------------
---- Entity: debounce_tb_oneGlitch                                    ----
---- Description: Testbench for specified stimulus file                ----
---- Author: Martin A. Heredia                                         ----
---- Last revision: 05/08/2020                                         ----
---- Dependencies:                                                     ----
----     IEEE.std_logic_1164	                                         ----
----	   IEEE.std_logic_textio                                         ----
----        This last dependency requires '-fsynopsys' option          ----
----        of GHDL                                                    ----
----    std.textio                                                     ----
----    work.parametersPackage                                         ----
----	                                                                 ----
----                                                                   ----
----                                                                   ----
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
library std;
use std.textio.all;
library work;
use work.parametersPackage.all;

entity debounce_tb_oneGlitch is
end entity debounce_tb_oneGlitch;

architecture debounce_tb_oneGlitch_arch of debounce_tb_oneGlitch is
    signal done_s : boolean := FALSE;
		constant STIMULUS_FILE : string := "stimulus/stim_one_glitch.txt"; --Archivo de estímulos
    constant PER2 : time := (1.0/(2.0*F_CLOCK_MHZ)) * 1 us;
    signal test_btn_in : std_logic;
		signal test_clk_in : std_logic;
		signal test_rst_in_n : std_logic;
		signal test_y_out : std_logic;
begin

    DUT: entity work.debounce
		    generic map(debounceTime => DEBOUNCE_TIME, clkFreqMhz => F_CLOCK_MHZ)
		    port map(
				    btn_in => test_btn_in,
						rst_in_n => test_rst_in_n,
						clk_in => test_clk_in,
						y_out => test_y_out);

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
			      test_btn_in <= sl_buff;
			      wait for t_buff; --tiempo entre muestras
            assert (test_y_out = '1') report "Glitch detected" severity failure;
		    end loop;
		    file_close(F);
        report "Test finished OK!";
		    done_s <= TRUE;
		    wait;
    end process stimulus;

end architecture debounce_tb_oneGlitch_arch;
