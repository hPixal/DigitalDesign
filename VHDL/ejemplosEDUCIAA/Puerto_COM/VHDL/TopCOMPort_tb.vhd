--------------------------------------------------------------------------------------------------
---- Entity: TopCOMPort_tb                                                                    ----
---- Description: Test TopCOMPOrt module                                                      ----
---- Author: Martín A. Heredia                                                                ----
---- Last revision: 14/06/2020                                                                ----
---- Dependencies:                                                                            ----
----	IEEE.std_logic_1164                                                                   ----
----	IEEE.numeric_std                                                                      ----
----	IEEE.std_logic_textio                                                                 ----
----        This last one dependecie requires '-fsynopsys' option                             ----
----        of GHDL                                                                           ----
----    std.textio                                                                            ----
---- Third part IP Cores: miniuart (UART_C)		                                      ----
----	Authors:                                                                              ----
----	  Philippe Carton, philippe.carton2 libertysurf.fr                                    ----
----      Juan Pablo Daniel Borgna, jpdborgna gmail.com                                       ----
----	  Salvador E. Tropea, salvador inti.gob.ar                                            ----
----                                                                                          ----
--------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
library std;
use std.textio.all;

entity TopCOMPort_tb is
end entity TopCOMPort_tb;

architecture TopCOMPort_tb_arch of TopCOMPort_tb is
signal test_clk_in : std_logic;
signal tx_clk : std_logic;
signal test_rst_in_n: std_logic;
constant PER2 : time := (1 us /2); --periodo/2 (el test será hecho con un test_clk_in de 1 MHZ)
constant BRDIVISOR : positive := 26;
constant TIMERCOUNT : integer := 1000;
constant TX_PER2 : time := PER2*BRDIVISOR*4;
constant BYTES_FILE : string := "bytes.txt";
signal done_s : boolean := FALSE;
signal test_tx_out_s : std_logic;
signal rx_reg : std_logic_vector(7 downto 0); --Registro para almacenar los datos de test_tx_out_s
signal rx_ena : std_logic; --Señal de enable para el registro Rx del test
signal rxDone_s : std_logic; --Señal para indicar que se leyó un Byte desde el DUT
type matrix is array (0 to 8) of std_logic_vector (7 downto 0);
signal msg_s : matrix := (others => (others => '0')); --en msg_s se almacenan los bytes que deberan compararse
begin                                               --con los recibidos por test_tx_out_s

--Leer bytes desde un archivo externo
ReadBytesFromFile:
process
file F : text;
variable buff : line;
variable sl_buff : std_logic_vector(7 downto 0);
variable i : integer range 0 to 9 := 0;
begin
    file_open(F,BYTES_FILE,read_mode);
    while not(endfile(F)) loop
        readline(F , buff);
        read(buff,sl_buff);
        msg_s(i) <= sl_buff;
        i := i+1;
    end loop;
    file_close(F);
    wait;
end process ReadBytesFromFile;

--DUT (Device Under Test)
TopCOMPort: entity work.TopCOMPort
    generic map(brDivisor => BRDIVISOR, timerCount => TIMERCOUNT)
    port map(clk_in => test_clk_in, rst_in_n => test_rst_in_n, tx_out => test_tx_out_s);

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

--TxClock: clock de referencia para leer de manera sincrónica la señal test_tx_out_s
DoTxClock:
process
begin
    tx_clk <= '1';
    wait for TX_PER2;
    tx_clk <= '0';
    wait for TX_PER2;
    if done_s then
        wait;
    end if;
end process DoTxClock;

--Registro de desplazamiento para guardar los datos enviados por el DUT
TestReg:
process(tx_clk,test_rst_in_n)
variable index : integer range 0 to 7;
begin
    if(test_rst_in_n = '0') then
        rx_reg <= (others => '0');
        rxDone_s <= '0';
        index := 0;
    elsif(falling_edge(tx_clk) and (rx_ena = '1')) then
        rx_reg <= test_tx_out_s&rx_reg(7 downto 1);
        if(index = 7) then
            index := 0;
            rxDone_s <= '1';
        else
            index := index+1;
            rxDone_s <= '0';
        end if;
    end if;
end process TestReg;

--Test
DoTest:
process
begin
    --Starting Test
    report "TopCOMPort_tb start...";
    --reset
    report "Reset";
    test_rst_in_n <= '0';
    rx_ena <= '0';
    wait for 5*PER2;
    test_rst_in_n <= '1';
    --Comenzar a recibir mensaje
    for k in 0 to 8 loop
        --Esperar bit de start
        wait until test_tx_out_s = '0';
        report "Start bit received";
        --Esperar siguiente flanco negativo de tx_clk
        wait until tx_clk = '0';
        --Habilitar rx_reg
        rx_ena <= '1';
        wait until rxDone_s = '1';
        rx_ena <= '0';
        assert (rx_reg = msg_s(k)) report "WRONG BYTE RECEIVED!" severity failure;
        --Esperar bit de stop
        wait until test_tx_out_s = '1';
        report "Stop bit received";
    end loop;
    --Esperar bit de start
    wait until test_tx_out_s = '0';
    report "Start bit received";
    report "Test finished OK";
    done_s <= TRUE;
    wait;
end process DoTest;

end architecture TopCOMPort_tb_arch;
