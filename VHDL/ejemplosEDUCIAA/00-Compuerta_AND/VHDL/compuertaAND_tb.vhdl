--------------------------------------------------------------------------------
--- Entidad: compuerta_and_tb
--- Descripción: Esta entidad es un tesbench que permite verificar el
--               funcionamiento de una compuerta and de dos entradas de un bit.
--- Autor/es: Hernán Pablo Mendes Gouveia.
--- Ultima revisión: 11/09/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--                Paquete numeric_std.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;                 --Estándar IEEE
use ieee.std_logic_1164.all;  --Biblioteca std_logic
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos

--Entidad del Testbench (vacío)
entity compuerta_and_tb is
end entity compuerta_and_tb;

--Arquitectura del Testbench
architecture compuerta_and_tb_arch of compuerta_and_tb is

--DECLARAR ESTIMULOS
--Entradas a la compuerta
signal test_a : std_logic;
signal test_b : std_logic;
signal test_q : std_logic;

--DEFINIR CONSTANTES
constant PERIODO : time := 100 ns;

component compuerta_and is
  port(
      a_in, b_in: in std_logic;
      q_out: out std_logic
  );
end component compuerta_and;

begin
--INSTANCIAR E INTERCONECTAR DUT
and0 : compuerta_and port map(a_in=>test_a,b_in=>test_b,q_out=>test_q);

--ESTIMULOS
--Proceso de generación de entradas
process begin
    test_a <= '0';
    test_b <= '0';
    wait for 2*PERIODO;
    test_a <= '1';
    test_b <= '0';
    wait for PERIODO;
    test_a <= '0';
    test_b <= '1';
    wait for PERIODO;
    test_a <= '1';
    test_b <= '1';
    wait for PERIODO;
    test_a <= '0';
    test_b <= '0';
    wait for PERIODO;
    wait;
end process;

end architecture compuerta_and_tb_arch;
