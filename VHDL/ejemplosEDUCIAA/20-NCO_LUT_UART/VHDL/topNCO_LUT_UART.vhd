--------------------------------------------------------------------------------------------------
---- Entity: topNCO_LUT_UART                                                                  ----
---- Description: Send NCO signal's samples through UART                                      ----
---- Author: Martín A. Heredia                                                                ----
---- Last revision: 04/09/2020                                                                ----
---- Dependencies:                                                                            ----
----	IEEE.std_logic_1164                                                                   ----
----	IEEE.numeric_std                                                                      ----
---- Third part IP Cores: miniuart (UART_C)		                                              ----
----	Authors:                                                                              ----
----    Philippe Carton, philippe.carton2 libertysurf.fr                                      ----
----    Juan Pablo Daniel Borgna, jpdborgna gmail.com                                         ----
----    Salvador E. Tropea, salvador inti.gob.ar                                              ----
----                                                                                          ----
--------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity topNCO_LUT_UART is
    generic(
        brDivisor : positive:= 26; --Divisor para elegir baudrate => 26 ~= 12MHz/(4*115200)
        dataBits : integer range 7 to 8 := 8;
        ncoBits : integer range 1 to 12 := 10;
        freqControlBits : integer range 1 to 8 := 3);
    port(
        clk_in : in std_logic;
        rst_in_n : in std_logic;
        fcw_in : in std_logic_vector(freqControlBits-1 downto 0);
        tx_out : out std_logic);
end entity topNCO_LUT_UART;

architecture topNCO_LUT_UART_arch of topNCO_LUT_UART is
    --Señales de UART_C--
    signal wb_clk : std_logic;  -- clock
    signal wb_rst : std_logic;  -- Reset input
    signal wbAdr_bus : std_logic_vector(0 downto 0); -- Adress bus
    signal wbDatIn_bus : std_logic_vector(7 downto 0); -- DataIn Bus
    signal wbDatOut_bus : std_logic_vector(7 downto 0); -- DataOut Bus
    signal wbWrite_ena  : std_logic;  -- Write Enable
    signal wbStb_s : std_logic;  -- Strobe
    signal wbAck_s : std_logic;  -- Acknowledge
    signal inttx_s  : std_logic;  -- Transmit interrupt: indicate waiting for Byte
    signal intrx_s  : std_logic;  -- Receive interrupt: indicate Byte received
    signal br_clk : std_logic;  -- Clock used for Transmit/Receive
    signal txd_s : std_logic;  -- Tx RS232 Line
    signal rxd_s : std_logic; -- Rx RS232 Line
    --Señales de NCO--
    signal nco_out_s :  std_logic_vector(ncoBits-1 downto 0);
    signal fcw_s : std_logic_vector(freqControlBits-1 downto 0);
    --Señales LUT
    signal sample_s : std_logic_vector(dataBits-1 downto 0);
begin

    --Outputs
    tx_out <= txd_s;

    --Instanciar UART
    UART: entity work.UART_C
        generic map(BRDIVISOR => BrDivisor)
        port map(
                wb_clk_i => wb_clk,
                wb_rst_i => wb_rst,
                wb_adr_i => wbAdr_bus,
                wb_dat_i => wbDatIn_bus,
                wb_dat_o => wbDatOut_bus,
                wb_we_i => wbWrite_ena,
                wb_stb_i => wbStb_s,
                wb_ack_o => wbAck_s,
                inttx_o => inttx_s,
                intrx_o => intrx_s,
                br_clk_i => br_clk,
                txd_pad_o => txd_s,
                rxd_pad_i => rxd_s);

    wb_clk <= clk_in;
    wb_rst <= not rst_in_n;
    wbAdr_bus <= "0";
    br_clk <= '1';
    wbStb_s <= '1';
    rxd_s <= '0';

    --Enviar sample
    load:
    process(clk_in)
    begin
        if(rising_edge(clk_in)) then
            if(wb_rst = '1') then
                wbWrite_ena <= '0';
            elsif(inttx_s = '1') then
                wbDatIn_bus  <= sample_s;
                wbWrite_ena <= '1';
            else
                wbWrite_ena <= '0';
            end if; --reset
        end if; --rising_edge clk_in
    end process load;

    --Instanciar NCO
    nco: entity work.nco
    generic map(ncoBits => ncoBits, freqControlBits => freqControlBits)
    port map(
        clk_in => clk_in,
        rst_in_n => rst_in_n,
        fcw_in => fcw_s,
        nco_out => nco_out_s);

    --Cuando la UART está transmitiendo (inttx_s = 0)
    -- el NCO no cuenta (fcw_s = 0). Una vez que termina
    -- de transmitir un sample, inttx_s = 1, y el NCO
    -- incrementa en la cantidad dada por fcw_in
    fcw_s <= fcw_in when inttx_s = '1' else (others=>'0');

    --Instanciar LUT
    LUT: entity work.signalLUT
    generic map(dataBits => dataBits, addBits => ncoBits)
    port map(
        addr_in => nco_out_s,
        data_out => sample_s);


end architecture topNCO_LUT_UART_arch;
