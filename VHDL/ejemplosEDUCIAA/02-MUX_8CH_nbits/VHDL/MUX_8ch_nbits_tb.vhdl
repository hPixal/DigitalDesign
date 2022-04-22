--------------------------------------------------------------------------------
--- Entidad: multiplexor8Channels_tb.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un multiplexor de 8 canales de n bits.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 16/05/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity multiplexor8Channels_tb is
end entity multiplexor8Channels_tb;

architecture multiplexor8Channels_tb_arch of multiplexor8Channels_tb is

    constant period : time:=10 ns;
    constant bits   : integer := 2;

    signal test_ch0 : std_logic_vector(1 downto 0);
    signal test_ch1 : std_logic_vector(1 downto 0);
    signal test_ch2 : std_logic_vector(1 downto 0);
    signal test_ch3 : std_logic_vector(1 downto 0);
    signal test_ch4 : std_logic_vector(1 downto 0);
    signal test_ch5 : std_logic_vector(1 downto 0);
    signal test_ch6 : std_logic_vector(1 downto 0);
    signal test_ch7 : std_logic_vector(1 downto 0);
    signal test_sel : std_logic_vector(2 downto 0);
    signal test_chout : std_logic_vector(1 downto 0);

    component multiplexor8Channels is
        generic(bitsChannel : integer := 1);
        port(
              ch0_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch1_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch2_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch3_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch4_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch5_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch6_in : in  std_logic_vector(bitsChannel-1 downto 0);
              ch7_in : in  std_logic_vector(bitsChannel-1 downto 0);
              sel_in : in  std_logic_vector(2 downto 0);
              ch_out : out std_logic_vector(bitsChannel-1 downto 0)
        );
    end component;


begin
    --Instanciacion del DUT
    mux8 : multiplexor8Channels generic map(bitsChannel=>bits)
                                port map(ch0_in=>test_ch0,
                                         ch1_in=>test_ch1,
                                         ch2_in=>test_ch2,
                                         ch3_in=>test_ch3,
                                         ch4_in=>test_ch4,
                                         ch5_in=>test_ch5,
                                         ch6_in=>test_ch6,
                                         ch7_in=>test_ch7,
                                         sel_in=>test_sel,
                                         ch_out=>test_chout) ;

    --Proceso de simulación
    simulate: process
    begin
          --Inicializacion de estados
          test_ch0 <= (others=>'0');
          test_ch1 <= (others=>'0');
          test_ch2 <= (others=>'0');
          test_ch3 <= (others=>'0');
          test_ch4 <= (others=>'0');
          test_ch5 <= (others=>'0');
          test_ch6 <= (others=>'0');
          test_ch7 <= (others=>'0');
          test_sel <= (others=>'0');
          wait for period;

          --Valores iniciales de los 8 canales
          test_ch0 <= "01";
          test_ch1 <= "01";
          test_ch2 <= "11";
          test_ch3 <= "00";
          test_ch4 <= "10";
          test_ch5 <= "01";
          test_ch6 <= "00";
          test_ch7 <= "11";
          --Probamos todas las posibles combinaciones de las entradas de seleccion
          wait for period;
          test_sel <= "001";
          wait for period;
          test_sel <= "010";
          wait for period;
          test_sel <= "011";
          wait for period;
          test_sel <= "100";
          wait for period;
          test_sel <= "101";
          wait for period;
          test_sel <= "110";
          wait for period;
          test_sel <= "111";
          wait for period;
          wait for period;
          wait;
      end process simulate;

end architecture multiplexor8Channels_tb_arch;

