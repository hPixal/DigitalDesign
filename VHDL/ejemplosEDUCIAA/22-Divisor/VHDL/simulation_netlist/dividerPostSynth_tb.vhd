---------------------------------------------------------------------------
---- Entity:  divider_tb                                               ----
---- Description: Testbench for divider ip core                        ----
---- Author:  Martín A. Heredia                                        ----
---- Last revision: 25/07/2020                                         ----
---- Dependencies:                                                     ----
----	IEEE.std_logic_1164                                              ----
----	IEEE.numeric_std                                                 ----
----	IEEE.std_logic_textio                                            ----
----        This last dependency requires '-fsynopsys' option          ----
----        of GHDL                                                    ----
----    std.textio                                                     ----
----    work.parametersPackage                                         ----
----	                                                                 ----
---------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_textio.all;
library std;
use std.textio.all;
library work;
use work.parametersPackage.all; --package de constantes generadas con script

entity dividerPostSynth_tb is
end entity dividerPostSynth_tb;


architecture dividerPostSynth_tb_arch of dividerPostSynth_tb is
    constant PER2 : time := 10 ns;
    constant STIMULUS_FILE : string := "stimulus.txt";
    signal test_rst_in_n : std_logic;
    signal test_clk_in : std_logic;
    signal test_num_in_reg : unsigned(NBITS-1 downto 0);
    signal test_den_in_reg : unsigned(NBITS-1 downto 0);
    signal test_res_out_reg : unsigned(NBITS-1 downto 0);
    signal res_out : std_logic_vector(NBITS-1 downto 0);
    signal test_rmn_out_reg : unsigned(NBITS-1 downto 0);
    signal rmn_out : std_logic_vector(NBITS-1 downto 0);
    signal test_start_in_s : std_logic;
    signal test_resultOk_out_s : std_logic;
    signal test_divZero_out_s : std_logic;
    signal test_running_out_s : std_logic;
    signal done_s : boolean := FALSE;
begin

    --DUT
    DUT : entity work.divider
        port map (
            num_in=>std_logic_vector(test_num_in_reg),
            den_in=>std_logic_vector(test_den_in_reg),
            clk_in=>test_clk_in,
            rst_in_n=>test_rst_in_n,
            start_in=>test_start_in_s,
            res_out=>res_out,
            rmn_out=>rmn_out,
            resultOk_out=>test_resultOk_out_s,
            divZero_out=>test_divZero_out_s,
            running_out=>test_running_out_s);

    test_res_out_reg <= unsigned(res_out);
    test_rmn_out_reg <= unsigned(rmn_out);

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
    variable int_buff : integer;
    variable c_buff : character;
    variable res : unsigned(NBITS-1 downto 0);
    variable rmn : unsigned(NBITS-1 downto 0);
    begin
        --Inicio del Test
        report "divider_tb start...";
        --Reset
        report "Reset";
        test_rst_in_n <= '0';
        test_start_in_s <= '0';
        test_num_in_reg <= "00001011";
        test_den_in_reg <= "00000010";
        wait for 4*PER2;
        test_rst_in_n <= '1';
        wait for 4*PER2;
        test_start_in_s <= '1';
        wait for 4*PER2;
        test_start_in_s <= '0';
        wait for 40*PER2;
        done_s <= TRUE;
        wait;
    end process DoTest;

end architecture dividerPostSynth_tb_arch;
