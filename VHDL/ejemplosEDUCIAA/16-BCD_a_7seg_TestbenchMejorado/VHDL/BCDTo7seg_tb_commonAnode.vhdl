--------------------------------------------------------------------------------
--- Entidad:BCDTo7seg_tb_commonAnode.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un decodificador de BCD a 7 segmentos, que
--               convierte valores de 0 a 15, posee una línea de habilitación y
--               su salida es de ánodo común.
--               Este testbench fue hecho no solo para ver las formas de onda
--               sino más que nada para tener un comportamiento más automático.
--               El testbench lee los estímulos del archivo
--               "BCDa7s_anodoComun_inouts" y, en caso de que la salida del
--               decodificador no coincida con el valor de prueba, se
--               disparan assertions y se muestran reportes.
--- Propósito: Este testbench prueba de forma exhaustiva al decodificador.
--- Autor/es: Federico Alejandro Vazquez Saraullo y Martín Heredia.
--- Ultima revisión: 06/01/2021.
--- Dependencias: *Paquetes std_logic_1164.all, ieee.numeric_std.all y
--                 std_logic_textio.all de la biblioteca estándar ieee.
--                *Paquete std.textio.all de la biblioteca estándar std.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                  --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;   --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;      --Paquete para unsigned y signed.
use ieee.std_logic_textio.all; --Paquete para sobrecarga de procedimientos de
                               --lectura y escritura del paquete
                               --"std_textio".

library std;        --Biblioteca estándar std.
use std.textio.all; --Paquete para manejo de archivos.

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

    --Declaración de señal auxiliar para guardar el número de estímulo leído.
    signal stimulus_cnt_s : unsigned(4 downto 0);

    --Procedimiento para hacer un assertion y mostrar un reporte en caso de que
    --el valor de salida no coincida con el de prueba. Los valores de entrada
    --son constantes para que no se puedan alterar dentro del procedimiento.
    procedure AssertIfNoMatch_proc(
        constant VALUE_TO_TEST : in std_logic_vector(6 downto 0);
        constant CHECK_VALUE   : in std_logic_vector(6 downto 0);
        constant CHECK_CNT     : in unsigned(4 downto 0)
    ) is
    begin
        assert (unsigned(VALUE_TO_TEST) = unsigned(CHECK_VALUE))
        report "Wrong output for input number: "
                & integer'image(to_integer(CHECK_CNT))
        severity error;
    end procedure AssertIfNoMatch_proc;
begin
    --Instanciación del DUT (Device Under Test).
    BCDTo7seg_0: BCDTo7seg
        generic map (commonAnode => TRUE)
        port map ( BCD_in   => test_BCD_s,
                   ena_in   => test_ena_s,
                   seg7_out => test_seg7_s );

    --Proceso de lectura y aplicación de estímulos.
    readStimulus : process
        --Se crean las variables necesarias para la lectura.
        file file_v      : text;
        variable buff_v  : line;
        variable ena_v   : std_logic;
        variable bcd_v   : std_logic_vector(3 downto 0);
        variable check_v : std_logic_vector(6 downto 0);
    begin
        stimulus_cnt_s <= to_unsigned(0, 5); --Valor inicial.

        file_open(file_v , "BCDTo7seg_commonAnode_inouts.txt", read_mode);
        while not endfile(file_v) loop
            --Lectura del archivo.
            readline(file_v, buff_v);
            read(buff_v, ena_v);
            read(buff_v, bcd_v);
            read(buff_v, check_v);

            --Asignación de señales estímulo.
            test_ena_s <= ena_v;
            test_BCD_s <= bcd_v;
            wait for 10 ns;

            --Assertion y reporte en caso de no coincidir la salida con el valor
            --esperado.
            AssertIfNoMatch_proc(test_seg7_s, check_v, stimulus_cnt_s);

            --Aumento del contador de número de estímulo.
            stimulus_cnt_s <= stimulus_cnt_s + 1;
        end loop;
        file_close(file_v);
        wait;
    end process readStimulus;
end architecture BCDTo7seg_tb_commonAnode_arch;
