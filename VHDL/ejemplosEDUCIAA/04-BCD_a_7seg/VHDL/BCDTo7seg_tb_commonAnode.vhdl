--------------------------------------------------------------------------------
--- Entidad:BCDTo7seg_tb_commonAnode.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un decodificador de BCD a 7 segmentos, que
--               convierte valores de 0 a 15, posee una línea de habilitación y
--               su salida es de ánodo común.
--- Propósito: Este testbench prueba de forma exhaustiva al decodificador.
--- Autor/es: Martín Heredia y Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: *Paquete std_logic_1164.all.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.

--Entidad del testbench (vacía).
entity BCDTo7seg_tb_commonAnode is
end entity BCDTo7seg_tb_commonAnode;

--Arquitectura del testbench.
architecture BCDTo7seg_tb_commonAnode_arch of BCDTo7seg_tb_commonAnode is
    --Declaración del decodificador a probar.
    component BCDTo7seg is
        generic (
            commonAnode : BOOLEAN := TRUE
        );
        port (
            BCD_in   : in  std_logic_vector(3 downto 0);
            ena_in   : in  std_logic;
            seg7_out : out std_logic_vector(6 downto 0)
        );
    end component;

    --Declaración de estímulos y señal de monitoreo.
    --Entradas al decodificador.
    signal test_BCD_s : std_logic_vector(3 downto 0);
    signal test_ena_s : std_logic;

    --Salidas del decodificador.
    signal test_seg7_s : std_logic_vector(6 downto 0);

    --Declaración de tipo de dato stimulus y de tipo vector de stimulus para
    --agrupar en este los valores de entrada.
    type stimulus is record
        ena : std_logic;
        bcd : std_logic_vector(3 downto 0);
    end record stimulus;

    type stimulus_vec is array (integer range <>) of stimulus;

    --Declaración de un vector de stimulus con los datos de entrada.
    constant IN_BCD : stimulus_vec := (
        ('1', "0000"), ('1', "0001"), ('1', "0010"), ('1', "0011"),
        ('1', "0100"), ('1', "0101"), ('1', "0110"), ('1', "0111"),
        ('1', "1000"), ('1', "1001"), ('1', "1010"), ('1', "1011"),
        ('1', "1100"), ('1', "1101"), ('1', "1110"), ('1', "1111"),

        ('0', "0000"), ('0', "0001"), ('0', "0010"), ('0', "0011"),
        ('0', "0100"), ('0', "0101"), ('0', "0110"), ('0', "0111"),
        ('0', "1000"), ('0', "1001"), ('0', "1010"), ('0', "1011"),
        ('0', "1100"), ('0', "1101"), ('0', "1110"), ('0', "1111")
    );

begin
    --Instanciación del DUT (Device Under Test).
    BCDTo7seg_0: BCDTo7seg
        generic map (commonAnode => TRUE)
        port map ( BCD_in   => test_BCD_s,
                   ena_in   => test_ena_s,
                   seg7_out => test_seg7_s );

    --Proceso de aplicación de estímulos.
    applyStimulus : process
    begin
        for i in IN_BCD'range loop
            test_ena_s <= IN_BCD(i).ena;
            test_BCD_s <= IN_BCD(i).bcd;
            wait for 10 ns;
        end loop;
        wait;
    end process applyStimulus;
end architecture BCDTo7seg_tb_commonAnode_arch;
