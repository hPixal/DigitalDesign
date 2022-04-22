---------------------------------------------------------------------------
---- Entity:  nco_tb                                                   ----
---- Description:    Implement Testbench for NCO                       ----
---- Author:  Martín A. Heredia                                        ----
---- Last revision:    24/05/2020                                      ----
---- Dependencies:                                                     ----
----	IEEE.std_logic_1164                                            ----
----	IEEE.numeric_std                                               ----
----	IEEE.math_real                                                 ----
----	IEEE.std_logic_textio                                          ----
----        This last dependency requires '-fsynopsys' option          ----
----        of GHDL                                                    ----
----    std.textio                                                     ----
----    work.parametersPackage                                         ----
----	                                                               ----
----	                                                               ----
----                                                                   ----
----                                                                   ----
---------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use IEEE.std_logic_textio.all;
library std;
use std.textio.all;
library work;
use work.parametersPackage.all; --package de constantes generadas con script

entity nco_tb is
end entity nco_tb;

architecture nco_tb_arch of nco_tb is
    constant PER2 : time := (1 us /2); --periodo/2 (el test será hecho con un test_clk_in de 1 MHZ)
    constant STIMULUS_FILE : string := "stimulus.txt"; --Archivo de estímulos
    constant N_CTRL_WORDS : integer := (2**FREQCONTROLBITS); --Cantidad de valores que puede tomar test_fcw_in_s
    constant ZEROES : std_logic_vector(NCOBITS-1 downto 0) := (others => '0');
    signal test_clk_in : std_logic;
    signal test_rst_in_n : std_logic;
    signal test_fcw_in_s : std_logic_vector(FREQCONTROLBITS-1 downto 0);
    signal test_nco_out_s :  std_logic_vector(NCOBITS-1 downto 0);
    signal done_s : boolean := FALSE;
begin

--DUT (Device Under Test)
nco: entity work.nco
    generic map(ncoBits => NCOBITS, freqControlBits => FREQCONTROLBITS)
    port map(
        clk_in => test_clk_in,
        rst_in_n => test_rst_in_n,
        fcw_in => test_fcw_in_s,
        nco_out => test_nco_out_s);

--Clock: clock de 1 MHz
DoClock:
process
begin
    test_clk_in <= '1';
    wait for PER2;
    test_clk_in <= '0';
    wait for PER2;
    if done_s then
        wait;
    end if;
end process DoClock;

--Test
DoTest:
process
file F : text;
variable buff : line;
variable sl_buff : std_logic_vector(NCOBITS-1 downto 0);
variable c_buff : character;
variable i : integer range 1 to (N_CTRL_WORDS-1) := 1;
begin
    --Starting Test
    report "nco_tb start...";
    --reset
    report "Reset";
    test_rst_in_n <= '0';
    test_fcw_in_s <= std_logic_vector(to_unsigned(i,FREQCONTROLBITS));
    wait for 5*PER2;
    test_rst_in_n <= '1';
    --Read stimulus
    report "Opening stimulus file and starting loop...";
    file_open(F,STIMULUS_FILE,read_mode);
    while not(endfile(F)) loop
        readline(F , buff);
        read(buff,c_buff);
        if(c_buff /= '#') then
            read(buff,sl_buff);
            assert(test_nco_out_s = sl_buff) report "WRONG OUTPUT" severity error;
            wait on test_nco_out_s;
        else
            report "Change fcw and reset...";
            test_rst_in_n <= '0';
            wait for 2*PER2;
            if(i < N_CTRL_WORDS-1) then
                i := i+1;
                test_fcw_in_s <= std_logic_vector(to_unsigned(i,FREQCONTROLBITS));
            end if;
            test_rst_in_n <= '1';
        end if;
    end loop;
    file_close(F);
    --Testing fcw = 0
    report "Testing fcw = 0";
    test_rst_in_n <= '0';
    test_fcw_in_s <= (others => '0');
    test_rst_in_n <= '1';
    wait for 5*PER2;
    assert(test_nco_out_s = ZEROES) report "WRONG OUTPUT" severity error;
    wait for 13*PER2;
    assert(test_nco_out_s = ZEROES) report "WRONG OUTPUT" severity error;
    test_rst_in_n <= '0';
    --Finish him!
    report "Test finished OK";
    done_s <= TRUE;
    wait;
end process DoTest;

end architecture nco_tb_arch;
