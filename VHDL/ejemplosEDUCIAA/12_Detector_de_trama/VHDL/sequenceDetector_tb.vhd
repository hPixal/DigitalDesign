---------------------------------------------------------------------------
---- Entity:  sequenceDetector_tb                                      ----
---- Description:    Implement Testbench for sequence detector         ----
---- Author:  Martín A. Heredia                                        ----
---- Last revision:    06/06/2020                                      ----
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
use work.parametersPackage.all; --Package de constantes generadas con script

entity sequenceDetector_tb is
end entity sequenceDetector_tb;

architecture sequenceDetector_tb_arch of sequenceDetector_tb is
    constant PER2 : time := (1 us /2); --Periodo/2 (el test será hecho con un test_clk_in de 1 MHZ)
    constant STIMULUS_FILE : string := "stimulus.txt"; --Archivo de estímulos
    constant INDEXES_FILE : string := "indexes.txt"; --Archivo de indices donde aparece la secuencia
    signal test_clk_in : std_logic;
    signal test_rst_in_n : std_logic;
    signal test_serial_in_s : std_logic;
    signal test_seq_in_s :  std_logic_vector(NBITS-1 downto 0);
    signal test_detection_out :  std_logic;
    signal done_s : boolean := FALSE;
begin

    --DUT
    seqDetector: entity work.sequenceDetector
        generic map(nBits => NBITS)
        port map(
            clk_in => test_clk_in,
            rst_in_n => test_rst_in_n,
            serial_in => test_serial_in_s,
            seq_in => test_seq_in_s,
            detection_out => test_detection_out);

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
    file F_STIM : text;
    file F_IND : text;
    variable buff_stim : line;
    variable buff_ind : line;
    variable sl_buff_stim : std_logic;
    variable int_buff_ind : integer :=0;
    variable occur : integer := 0;
    variable index : integer :=0;
    begin
        --Comenzando test
        report "sequenceDetector_tb start...";
        --Reset
        report "Reset";
        test_rst_in_n <= '0';
        test_seq_in_s <= SEQUENCE;
        test_serial_in_s <= '0';
        wait for 5*PER2;
        test_rst_in_n <= '1';
        wait for 2*PER2;
        --Leer estímulos e índices
        report "Opening stimulus file and starting loop...";
        file_open(F_IND,INDEXES_FILE,read_mode);
        file_open(F_STIM,STIMULUS_FILE,read_mode);
        readline(F_STIM , buff_stim);
        while (not (buff_stim'length = 0)) loop
            read(buff_stim,sl_buff_stim);
            test_serial_in_s <= sl_buff_stim;
            wait until falling_edge(test_clk_in);
            index := index+1;
            if(test_detection_out = '1') then
                readline(F_IND,buff_ind);
                read(buff_ind,int_buff_ind);
                assert (int_buff_ind >= 0) report "Error: end of indexes file reached" severity failure;
                assert (int_buff_ind = index) report "Error: indexes doesn't match" severity failure;
                report "Occurrence at index: "&integer'image(index);
                occur := occur+1;
            end if;
        end loop;
        file_close(F_STIM);
        file_close(F_IND);
        assert(occur = OCCURRENCES) report "Error: number of detections doesn't match" severity failure;
        report "Test finished OK";
        done_s <= TRUE;
        wait;
    end process DoTest;

end architecture sequenceDetector_tb_arch;
