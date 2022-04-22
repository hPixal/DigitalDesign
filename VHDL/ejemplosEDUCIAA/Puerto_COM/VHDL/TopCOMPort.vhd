--------------------------------------------------------------------------------------------------
---- Entity: TopCOMPort                                                                       ----
---- Description: Send 'EDU-FPGA' message through EDU-FPGA's COM port every 1 second          ----
---- Author: Martín A. Heredia                                                                ----
---- Last revision: 09/05/2020                                                                ----
---- Dependencies:                                                                            ----
----	IEEE.std_logic_1164                                                                   ----
----	IEEE.numeric_std                                                                      ----
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

entity TopCOMPort is
generic(
    brDivisor : positive:= 312; --Divisor para elegir baudrate => 312 = 12MHz/(4*9600)
    timerCount: integer := 12000000);
port(
    clk_in : in std_logic;
    rst_in_n : in std_logic;
    tx_out : out std_logic);
end entity TopCOMPort;

architecture TopCOMPort_arch of TopCOMPort is
--Señales de miniuart--
signal wb_clk : std_logic;  -- clock
signal wb_rst : std_logic;  -- Reset input
signal wbAdr_bus : std_logic_vector(0 downto 0); -- Adress bus
signal wbDatIn_bus : std_logic_vector(7 downto 0); -- DataIn Bus
signal wbDatOut_bus : std_logic_vector(7 downto 0); -- DataOut Bus
signal wbWrite_ena  : std_logic;  -- Write Enable
signal wbStb : std_logic;  -- Strobe
signal wbAck : std_logic;  -- Acknowledge
signal inttx_s  : std_logic;  -- Transmit interrupt: indicate waiting for Byte
signal intrx_s  : std_logic;  -- Receive interrupt: indicate Byte received
signal br_clk : std_logic;  -- Clock used for Transmit/Receive
signal txd_s : std_logic;  -- Tx RS232 Line
signal rxd_s : std_logic; -- Rx RS232 Line
--Señales del timer--
signal timer_cnt : unsigned(23 downto 0);
signal timer_rst : std_logic;
signal timerTc_s : std_logic;
--Mensaje a enviar por uart--
constant E : unsigned := "01000101";
constant D : unsigned := "01000100";
constant U : unsigned := "01010101";
constant DASH : unsigned := "01011111";
constant F : unsigned := "01000110";
constant P : unsigned := "01010000";
constant G : unsigned := "01000111";
constant A : unsigned := "01000001";
constant NEW_LINE : unsigned := "00001010";
type matrix is array (0 to 8) of unsigned (7 downto 0);
signal msg_s : matrix := (others => (others => '0'));
signal msgSend_s : std_logic; --Señal de mensaje enviado
--Atributos del sintetizador--
attribute syn_keep : boolean;
attribute syn_keep of wbDatIn_bus : signal is true;

begin

tx_out <= txd_s;
wb_clk <= clk_in;
wb_rst <= not rst_in_n;
wbAdr_bus <= "0";
br_clk <= '1';
wbStb <= '1';
rxd_s <= '0';
timer_rst <= (not rst_in_n) or msgSend_s;

msg_s(0) <= E;
msg_s(1) <= D;
msg_s(2) <= U;
msg_s(3) <= DASH;
msg_s(4) <= F;
msg_s(5) <= P;
msg_s(6) <= G;
msg_s(7) <= A;
msg_s(8) <= NEW_LINE;


UART: entity work.UART_C
    generic map(BRDIVISOR => BrDivisor)
    port map(
		    wb_clk_i => wb_clk, wb_rst_i => wb_rst, wb_adr_i => wbAdr_bus,
		    wb_dat_i => wbDatIn_bus, wb_dat_o => wbDatOut_bus, wb_we_i => wbWrite_ena,
		    wb_stb_i => wbStb, wb_ack_o => wbAck, inttx_o => inttx_s,
		    intrx_o => intrx_s, br_clk_i => br_clk, txd_pad_o => txd_s,
		    rxd_pad_i => rxd_s);

--Enviar mensaje
load:
process(clk_in)
variable index : integer range 0 to 8;
begin
    if(rising_edge(clk_in)) then
        msgSend_s <= '0';
        if(wb_rst = '1') then
        wbWrite_ena <= '0';
        index := 0;
        elsif(inttx_s = '1' and timerTc_s = '1') then
            wbDatIn_bus <= std_logic_vector( msg_s(index) );
            wbWrite_ena <= '1';
            if(index = 8) then
                index := 0;
                msgSend_s <= '1';
            else
                index := index + 1;
            end if; --index = 8
        else
            wbWrite_ena <= '0';

        end if; --reset
    end if; --rising_edge clk_in
end process load;

--Timer para espera entre mensajes
counterDelay:
process(clk_in,timer_rst)
begin
    if(timer_rst = '1') then
        timer_cnt <= (others => '0');
        timerTc_s <= '0';
    elsif(rising_edge(clk_in)) then
        if(timer_cnt < TimerCount-1) then
            timer_cnt <= timer_cnt + 1;
            timerTc_s <= '0';
        else
            timerTc_s <= '1';
        end if;--timer_cnt < TimerCount-1
    end if;--rising_edge(clk_in)
end process counterDelay;

end architecture TopCOMPort_arch;
