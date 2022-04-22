---------------------------------------------------------------------------
---- Entity:  topNCO_LUT_UART_tb                                       ----
---- Description:    Implement Testbench for NCO, LUT and UART         ----
---- Author:  Martín A. Heredia                                        ----
---- Last revision:    30/05/2020                                      ----
---- Dependencies:                                                     ----
----	IEEE.std_logic_1164                                            ----
----	IEEE.numeric_std                                               ----
----	IEEE.math_real                                                 ----
----	IEEE.std_logic_textio                                          ----
----        This last one dependecie requires '-fsynopsys' option      ----
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

entity topNCO_LUT_UART_tb is
end entity topNCO_LUT_UART_tb;

architecture topNCO_LUT_UART_tb_arch of topNCO_LUT_UART_tb is
    constant PER2 : time := (83 ns /2); --periodo/2 (el test será hecho con un test_clk_in de 12 MHZ)
    constant STIMULUS_FILE : string := "stimulus.txt"; --Archivo de estímulos
    constant N_CTRL_WORDS : integer := (2**FREQCONTROLBITS); --Cantidad de valores que puede tomar test_fcw_in_s
    constant ZEROES : std_logic_vector(NCOBITS-1 downto 0) := (others => '0');
    signal test_clk_in : std_logic;
    signal test_rst_in_n : std_logic;
    signal test_fcw_in_s : std_logic_vector(FREQCONTROLBITS-1 downto 0);
    signal test_tx_out_s : std_logic;
    signal done_s : boolean := FALSE;
begin

--DUT
nco_lut_uart: entity work.topNCO_LUT_UART
    generic map(
        brDivisor => BRDIVISOR,
        dataBits => DATABITS,
        ncoBits => NCOBITS,
        freqControlBits => FREQCONTROLBITS)
    port map(
        clk_in => test_clk_in,
        rst_in_n => test_rst_in_n,
        fcw_in => test_fcw_in_s,
        tx_out => test_tx_out_s);

--Clock
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
    report "topNCO_LUT_UART_tb start...";
    --reset
    report "Reset";
    test_rst_in_n <= '0';
    test_fcw_in_s <= std_logic_vector(to_unsigned(i,FREQCONTROLBITS));
    wait for 5*PER2;
    test_rst_in_n <= '1';
    wait for 1024*8*4*BRDIVISOR*2*PER2;
    test_fcw_in_s <= std_logic_vector(to_unsigned(4,FREQCONTROLBITS));
    wait for 1024*8*4*BRDIVISOR*2*PER2;
    test_rst_in_n <= '0';
    --Finish him!
    report "Test finished OK";
    done_s <= TRUE;
    wait;
end process DoTest;

end architecture topNCO_LUT_UART_tb_arch;
