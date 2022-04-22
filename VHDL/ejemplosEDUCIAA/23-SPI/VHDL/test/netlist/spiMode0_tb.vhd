--------------------------------------------------------------------------
---- Entity:  spiMode0_tb                                             ----
---- Description: Testbench for spi IP Core                           ----
---- Author/s:  Martín A. Heredia                                     ----
---- Last revision: 16/08/2020                                        ----
---- Dependencies:                                                    ----
----	IEEE.std_logic_1164                                             ----
----	IEEE.numeric_std                                                ----
----  IEEE.math_real                                                  ----
----  work.parametersPackage                                          ----
----  work.TestbenchUtils                                             ----
----                                                                  ----
----                                                                  ----
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
library work;
use work.parametersPackage.all; --package de constantes generadas con script
use work.TestbenchUtils.all; --package con funciones y procedures utiles para testbench


entity spiMode0_tb is
end entity spiMode0_tb;

architecture spiMode0_tb_arch of spiMode0_tb is
    constant CPOL_TEST : std_logic := '0';
    constant CPHA_TEST : std_logic := '0';
    constant SHIFT_OUT_EDGE : std_logic := (CPOL_TEST xor CPHA_TEST);
    constant SHIFT_IN_EDGE : std_logic := not(SHIFT_OUT_EDGE);
    constant CS_ACTIVE : std_logic := CSPOL;
    constant CS_INACTIVE : std_logic := not(CSPOL);
    constant STIM_VEC_LENGTH : integer := DATABITS*(2**DATABITS);
    signal test_clk_in : std_logic;
    signal test_rst_in_n : std_logic;
    signal test_drdy_in : std_logic;
    signal test_serialD_in : std_logic;
		signal test_serialD_out : std_logic;
		signal test_cs_out : std_logic;
    signal test_sclk_out : std_logic;
		signal test_dataReceived_out : std_logic;
    signal test_shifting_out : std_logic;
		signal test_write_in : std_logic;
		signal test_data_in : std_logic_vector(DATABITS-1 downto 0);
		signal test_data_out : std_logic_vector(DATABITS-1 downto 0);
    signal dataToDUT_s : std_logic_vector(DATABITS-1 downto 0);
    signal dataSent_s : std_logic;
    signal dataReceivedFromDUT_s : std_logic_vector(DATABITS-1 downto 0);
		signal done_s : boolean := FALSE;
    signal i : integer range 0 to STIM_VEC_LENGTH;
    --Generar std_logic_vector a partir de entero
    function int_to_slv(
        constant INT : in integer;
        constant DBITS : in integer)
        return std_logic_vector is variable stimVec : std_logic_vector(DBITS-1 downto 0);
    begin
        stimVec := std_logic_vector(to_unsigned(INT,DBITS));
        return stimVec;
    end function int_to_slv;
begin

    --DUT
    dut : entity work.spi
        port map(
            clk_in => test_clk_in,
						rst_in_n => test_rst_in_n,
						drdy_in => test_drdy_in,
						serialD_in => test_serialD_in,
						serialD_out => test_serialD_out,
						cs_out => test_cs_out,
						sclk_out => test_sclk_out,
						dataReceived_out => test_dataReceived_out,
            shifting_out => test_shifting_out,
						write_in => test_write_in,
						data_in => test_data_in,
						data_out => test_data_out);

    --Clock
	  do_clock:
    process
    begin
        ClockGen(2*PER2,done_s,test_clk_in);
    end process do_clock;

    --Datos serie enviados al DUT:
    do_datastream:
    process(test_sclk_out,test_rst_in_n)
    begin
        if(test_rst_in_n = '0') then
            if(CPHA_TEST = '0') then
                test_serialD_in <= dataToDUT_s(DATABITS-1);
                i <= 1;
                dataSent_s <= '0';
            else
                test_serialD_in <= '0';
                i <= 0;
                dataSent_s <= '0';
            end if;
        elsif(test_sclk_out'event and test_sclk_out=SHIFT_OUT_EDGE) then
            test_serialD_in <= dataToDUT_s(DATABITS-1-i);
            if(i < DATABITS-1) then
                i <= i+1;
                dataSent_s <= '0';
            else
                i <= 0;
                dataSent_s <= '1';
            end if;
        end if;
    end process do_datastream;

    --Datos recibidos desde el DUT:
    do_receivedata:
    process(test_sclk_out,test_rst_in_n)
    begin
        if(test_rst_in_n = '0') then
            dataReceivedFromDUT_s <= (others => '0');
        elsif(test_sclk_out'event and test_sclk_out=SHIFT_IN_EDGE) then
            dataReceivedFromDUT_s <= dataReceivedFromDUT_s(DATABITS-2 downto 0) & test_serialD_out;
        end if;
    end process do_receivedata;

    --TEST
    main:
    process
    variable nSamplesOut : integer range 0 to 2**DATABITS := 0;
    variable nSamplesIn : integer range 0 to 2**DATABITS := 0;
    begin

        --Inicio del Test
        report "vUnitSPI_tb start...";

        --Reset
        report "Reset";
        test_rst_in_n <= '0';
		    test_drdy_in <= '1';
        test_data_in <= (others => '0');
        test_write_in <= '0';
        dataToDUT_s <= (others => '0');
		    wait for 20*PER2;
		    test_rst_in_n <= '1';
		    wait for 4*PER2;

        --Enviar datos al DUT y evaluar la recepción y retransmisión de los mismos
        --La retransmisión se da cuando en el proceso de recibir datos, el DUT
        --retransmite el ultimo byte (o bytes) recibidos. Es decir, al mismo tiempo
        --que el DUT recibe el byte n, retransmite el byte n-1
        while(nSamplesOut < 2**DATABITS) loop
            test_drdy_in <= '0';
            wait until dataSent_s = '1';
            dataToDUT_s <= int_to_slv(nSamplesOut+1,DATABITS);
            wait until test_dataReceived_out = '1';
            wait for PER2;
            assert(test_data_out = std_logic_vector(to_unsigned(nSamplesOut,DATABITS)))
                report "Error at RX in DUT" severity error;
            if(nSamplesOut > 0) then
                assert(dataReceivedFromDUT_s = std_logic_vector(to_unsigned(nSamplesOut-1,DATABITS)))
                    report "Error receiving data from DUT" severity error;
            end if;
            wait for 8*PER2;
            test_drdy_in <= '1';
            wait for 4*PER2;
            nSamplesOut := nSamplesOut+1;
        end loop;
        --Realizar una transmisión más para terminar de evaluar que
        --el DUT envíe por test_serialD_out el último dato recibido por
        --test_serialD_in
        test_drdy_in <= '0';
        wait until test_dataReceived_out = '1';
        wait for PER2;
        assert(dataReceivedFromDUT_s = std_logic_vector(to_unsigned(2**DATABITS - 1,DATABITS)))
            report "Error receiving data from DUT" severity error;
        wait for 8*PER2;
        test_drdy_in <= '1';
        wait for 4*PER2;

        --Probar el envío de datos desde el DUT hacia el Testbench
        while(nSamplesIn < 2**DATABITS) loop
            test_data_in <= std_logic_vector(to_unsigned(nSamplesIn,DATABITS));
            wait for 6*PER2;
            test_write_in <= '1';
            wait for 4*PER2;
            test_write_in <= '0';
            wait until test_dataReceived_out = '1';
            wait for PER2;
            assert(dataReceivedFromDUT_s = std_logic_vector(to_unsigned(nSamplesIn,DATABITS)))
                report "Error writing data out from DUT" severity error;
            nSamplesIn := nSamplesIn + 1;
        end loop;

        --Fin del test
        report "Test finished Ok";
		    done_s <= TRUE;
		    wait;
    end process main;

end architecture spiMode0_tb_arch	;
