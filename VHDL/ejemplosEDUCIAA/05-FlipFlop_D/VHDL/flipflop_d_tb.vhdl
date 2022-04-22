--------------------------------------------------------------------------------
--- Entidad: flipflop_d_tb
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un flip-flop tipo D de un bit.
--               En este testbench los datos de entrada y el clk entán a 
--               a diferentes frecuencias.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 11/07/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;                 --Estándar IEEE
use ieee.std_logic_1164.all;  --Biblioteca std_logic
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos

--Entidad del Testbench (vacío)
entity flipflop_d_tb is
end entity flipflop_d_tb;

--archuitectura del Testbench
architecture flipflop_d_tb_arch of flipflop_d_tb is

--DECLARAR ESTIMULOS

--Entradas al FF
signal test_clk : std_logic;
signal test_rst : std_logic;
signal test_data: std_logic;
signal test_q   : std_logic;

--Variable auxiliar para detener la simulación
signal test_stop : std_logic;

type stimulus_vec is array (0 to 6) of std_logic;

-- Crear los vectores de estimulos
constant dataTest_s : stimulus_vec := ('0','1','0','1','1','0','0');

--DEFINIR CONSTANTES
constant periodClk  : time := 60 ns;
constant periodData : time := 100 ns;

--DECLARAR DUT
component flipflop_d is
  port (
    clk_in  : in  std_logic;
    data_in : in  std_logic;
    rst_in  : in  std_logic;
    q_out   : out std_logic
  );
end component;


begin

--INSTANCIAR E INTERCONECTAR DUT
FF_D : flipflop_d port map(clk_in=>test_clk,data_in=>test_data,rst_in=>test_rst,q_out=>test_q);

--ESTIMULOS

--Proceso de reset inicial:
process begin
    test_rst <= '1';
    wait for periodClk; --El reset dura dos periods de clock
    test_rst <= '0';
    wait for periodClk;
    wait; --Bloquear al proceso
end process;

--Proceso de generación de clock
process begin
    test_clk <= '1';
    wait for periodClk;
    test_clk <= '0';
    wait for periodClk;
    if (test_stop='1') then
        wait;
    end if;
end process;

--Proceso de generación de entradas
process begin
    test_stop <= '0';
    for i in 0 to ((dataTest_s'length - 1)) loop
      test_data <= dataTest_s(i);
      wait for periodData;
    end loop;
    test_stop <= '1';
    wait;
end process;

end architecture flipflop_d_tb_arch;
