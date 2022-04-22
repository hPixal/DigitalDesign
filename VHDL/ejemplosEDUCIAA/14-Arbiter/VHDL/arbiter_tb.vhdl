--------------------------------------------------------------------------------
--- Entidad: arbiter_tb
--- Descripción: Esta entidad es un tesbench que permite verificar el
--               funcionamiento de un arbiter.
--- Autor/es: Hernán Pablo Mendes Gouveia.
--- Ultima revisión: 06/09/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--                Paquete numeric_std.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;                 --Estándar IEEE
use ieee.std_logic_1164.all;  --Biblioteca std_logic
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos

--Entidad del Testbench (vacío)
entity arbiter_tb is
end entity arbiter_tb;

--Arquitectura del Testbench
architecture arbiter_tb_arq of arbiter_tb is

--DECLARAR ESTIMULOS
signal test_req1 : std_logic;
signal test_req2 : std_logic;
signal test_rst  : std_logic;
signal test_clk  : std_logic;
signal test_gnt1 : std_logic;
signal test_gnt2 : std_logic;

--Variable auxiliar para detener la simulación
signal test_stop : std_logic;

--DEFINIR CONSTANTES
constant PERIODO : time := 100 ns;

--DECLARAR DUT
component arbiter is
    port(
        req1_in : in std_logic;
        req2_in : in std_logic;
        rst_in :  in std_logic;
        clk_in :  in std_logic;
        gnt1_out : out std_logic;
        gnt2_out : out std_logic
    );
end component arbiter;

begin

--INSTANCIAR E INTERCONECTAR DUT
arb : arbiter port map(req1_in =>test_req1,
                       req2_in =>test_req2,
                       rst_in  =>test_rst,
                       clk_in  =>test_clk,
                       gnt1_out=>test_gnt1,
                       gnt2_out=>test_gnt2);

--ESTIMULOS
--Proceso de reset inicial:
process begin
    test_rst <= '1';
    wait for 1*PERIODO; --El reset dura un PERIODO de clock
    test_rst <= '0';
    wait; --Bloquear al proceso
end process;

--Proceso de generación de clock
process begin
    test_clk <= '1';
    wait for PERIODO/2;
    test_clk <= '0';
    wait for PERIODO/2;
    if (test_stop='1') then
        wait;
    end if;
end process;

--Proceso de generación de entradas
process begin
    --Comienzan ambas entradas en bajo
    test_stop <= '0';
    test_req1 <= '0';
    test_req2 <= '0';
    wait for PERIODO;

    --Pedimos habilitacion para el primer dispositivo
    -- (se debería habilitar el grant para el primer dispositivo)
    test_req1 <= '1';
    wait for 2*PERIODO;

    -- Y luego de 2 periodos, pedimos para el segundo
    -- (como ya esta debería estar habilitado el grant para el
    -- primer dispositivo, esta request deberia ser ignorada)
    test_req2 <= '1';
    wait for 2*PERIODO;

    -- Luego de dos periodos llevamos a bajo el req2_in
    test_req2 <= '0';
    wait for 2*PERIODO;

    -- Y tambien el req1_in.
    -- (El arbiter debería pasar a estado IDLE)
    test_req1 <= '0';
    wait for 4*PERIODO;

    -- Repetimos el mismo proceso, pero a la inversa
    test_req2 <= '1';
    wait for 2*PERIODO;
    test_req1 <= '1';
    wait for 2*PERIODO;
    test_req1 <= '0';
    wait for 2*PERIODO;
    test_req2 <= '0';
    wait for 2*PERIODO;
    test_stop <= '1';
    wait;
end process;

end architecture arbiter_tb_arq;
