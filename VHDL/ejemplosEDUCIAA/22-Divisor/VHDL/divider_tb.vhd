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

entity divider_tb is
end entity divider_tb;


architecture divider_tb_arch of divider_tb is
    constant PER2 : time := 10 ns;
    constant STIMULUS_FILE : string := "stimulus.txt";
    signal test_rst_in_n : std_logic;
    signal test_clk_in : std_logic;
    signal test_num_in_reg : unsigned(NBITS-1 downto 0);
    signal test_den_in_reg : unsigned(NBITS-1 downto 0);
    signal test_res_out_reg : unsigned(NBITS-1 downto 0);
    signal test_rmn_out_reg : unsigned(NBITS-1 downto 0);
    signal test_start_in_s : std_logic;
    signal test_resultOk_out_s : std_logic;
    signal test_divZero_out_s : std_logic;
    signal test_running_out_s : std_logic;
    signal done_s : boolean := FALSE;
begin

    --DUT
    DUT : entity work.divider
        generic map (nBits => NBITS)
        port map (
            num_in=>test_num_in_reg,
            den_in=>test_den_in_reg,
            clk_in=>test_clk_in,
            rst_in_n=>test_rst_in_n,
            start_in=>test_start_in_s,
            res_out=>test_res_out_reg,
            rmn_out=>test_rmn_out_reg,
            resultOk_out=>test_resultOk_out_s,
            divZero_out=>test_divZero_out_s,
            running_out=>test_running_out_s);

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
        test_num_in_reg <= (others => '0');
        test_den_in_reg <= (others => '0');
        wait for 4*PER2;
        test_rst_in_n <= '1';
        --Leer estímulos
        report "Opening stimulus file and starting loop...";
        file_open(F,STIMULUS_FILE,read_mode);
        while not(endfile(F)) loop
            readline(F , buff);
            read(buff,c_buff);
            if(c_buff = 'c') then
                --Read num
                read(buff,int_buff);
                test_num_in_reg <= to_unsigned(int_buff,test_num_in_reg'length);
                --Read den
                read(buff,c_buff);
                read(buff,int_buff);
                test_den_in_reg <= to_unsigned(int_buff,test_den_in_reg'length);
                --Read result
                read(buff,c_buff);
                read(buff,int_buff);
                res := to_unsigned(int_buff,res'length);
                --Read remainder
                read(buff,c_buff);
                read(buff,int_buff);
                rmn := to_unsigned(int_buff,rmn'length);

                --Start
                report "Start and calculate...";
                test_start_in_s <= '1';
                wait on test_running_out_s;
                test_start_in_s <= '0';
                wait on test_resultOk_out_s,test_divZero_out_s;
                wait for 4*PER2;
                assert(test_divZero_out_s = '0') report "WRONG: divZero raised" severity failure;
                report "Num: "&integer'image(to_integer(unsigned(test_num_in_reg)));
                report "Den: "&integer'image(to_integer(unsigned(test_den_in_reg)));
                report "Result: "&integer'image(to_integer(unsigned(test_res_out_reg)));
                assert(test_res_out_reg = res)
                    report "WRONG RESULT, expected: "&integer'image(to_integer(res))
                        severity failure;
                report "Rmn: "&integer'image(to_integer(unsigned(test_rmn_out_reg)));
                assert(test_rmn_out_reg = rmn)
                    report "WRONG REMAINDER, expected: "&integer'image(to_integer(rmn))
                        severity failure;
                wait for 4*PER2;
            else
                --Read num
                read(buff,int_buff);
                test_num_in_reg <= to_unsigned(int_buff,test_num_in_reg'length);
                --Read den
                read(buff,c_buff);
                read(buff,int_buff);
                test_den_in_reg <= to_unsigned(int_buff,test_den_in_reg'length);

                --Start
                report "Divide by zero...";
                test_start_in_s <= '1';
                wait on test_running_out_s;
                test_start_in_s <= '0';
                wait on test_resultOk_out_s,test_divZero_out_s;
                assert(test_resultOk_out_s = '0') report "WRONG: reultOK raised" severity failure;
                assert(test_divZero_out_s = '1') report "WRONG: divZero = '1' expected" severity failure;
                report "Num: "&integer'image(to_integer(unsigned(test_num_in_reg)));
                report "Den: "&integer'image(to_integer(unsigned(test_den_in_reg)));
                wait for 4*PER2;
            end if;
        end loop;
        file_close(F);
        report "Test finished OK";
        done_s <= TRUE;
        wait;
    end process DoTest;

end architecture divider_tb_arch;
