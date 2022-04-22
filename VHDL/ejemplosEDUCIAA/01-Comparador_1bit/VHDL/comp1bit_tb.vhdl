--------------------------------------------------------------------------------
--- Entidad: comp1bit_tb.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un comparador de magnitud de 1 bit.
--- Propósito: Este testbench prueba de forma exhaustiva al comparador.
--- Autor/es: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.

--Entidad del testbench (vacía).
entity comp1bit_tb is
end entity comp1bit_tb;

--Arquitectura del testbench.
architecture comp1bit_tb_arch of comp1bit_tb is
    --Declaración del comparador de magnitud a probar.
    component comp1bit is
        port (
            a_in   : in  std_logic;
            b_in   : in  std_logic;
            eq_out : out std_logic;
            gt_out : out std_logic;
            lt_out : out std_logic
        );
    end component;

    --Declaración de estímulos y señal de monitoreo.
    --Entradas al comparador.
    signal test_a_s : std_logic;
    signal test_b_s : std_logic;

    --Salidas del comparador.
    signal test_eq_s : std_logic;
    signal test_gt_s : std_logic;
    signal test_lt_s : std_logic;
begin
    --Instanciación del DUT (Device Under Test).
    comp1bit_0 : comp1bit
        port map ( a_in   => test_a_s,
                   b_in   => test_b_s,
                   eq_out => test_eq_s,
                   gt_out => test_gt_s,
                   lt_out => test_lt_s);

    --Proceso de generación de entradas.
    generateStimulus : process
    begin
        test_a_s <= '0';
        test_b_s <= '0';
        wait for 100 ns;

        test_a_s <= '0';
        test_b_s <= '1';
        wait for 100 ns;

        test_a_s <= '1';
        test_b_s <= '0';
        wait for 100 ns;

        test_a_s <= '1';
        test_b_s <= '1';
        wait for 100 ns;
        wait;
    end process  generateStimulus;
end architecture comp1bit_tb_arch;
