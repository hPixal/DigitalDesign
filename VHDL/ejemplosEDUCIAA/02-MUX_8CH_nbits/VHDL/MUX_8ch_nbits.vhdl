--------------------------------------------------------------------------------
--- Entidad: multiplexor8Channels.
--- Descripción: Esta entidad es un multiplexor de 8 canales. El nro 
--               de bits en cada canal es configurable (bitsChannel). A través
--               de los 3 bits de seleccion se determina cual de los 8 canales
--               de entrada se reproduce a la salida.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 16/05/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity multiplexor8Channels is
    --Bits por canal
    generic(bitsChannel : integer := 1);

    --Puertos de E/S
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
end entity multiplexor8Channels ;

architecture multiplexor8Channels_arch of multiplexor8Channels is

signal zeros : std_logic_vector(bitsChannel-1 downto 0);

begin
    --Si la linea de seleccion va a un estado no definido, la salida va a cero
    zeros<=(others=>'0');

    with sel_in select
        ch_out <=  ch0_in  when "000",
                   ch1_in  when "001",
                   ch2_in  when "010",
                   ch3_in  when "011",
                   ch4_in  when "100",
                   ch5_in  when "101",
                   ch6_in  when "110",
                   ch7_in  when "111",
                   zeros   when others;

end architecture multiplexor8Channels_arch ;
