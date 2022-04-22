--------------------------------------------------------------------------------
--- Entidad: top_BCDTo7seg.
--- Descripción: Esta entidad es un decodificador BCD a 7 segmentos hecho
--               especialmente para la EDU-CIAA-FPGA. La entidad es de tipo
--               "wrapper" ya que instancia un bloque "BCDTo7seg" en su interior
--               y lo interconecta con sus propios puertos de entrada y salida,
--               teniendo en cuenta que la entrada BCD_in es negada internamente
--               para contrarrestar el efecto de los resistores pull-up
--               conectados a los pulsadores de la placa.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar ieee.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity top_BCDTo7seg is
    generic(commonAnode : BOOLEAN := FALSE);
    port(
        BCD_in   : in  std_logic_vector(3 downto 0);
        ena_in 	 : in  std_logic;
        seg7_out : out std_logic_vector(6 downto 0)
    );
end entity top_BCDTo7seg;

--Declaración de la arquitectura.
architecture top_BCDTo7seg_arch of top_BCDTo7seg is
    --Declaración del decodificador interno a instanciar.
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

    --Declaración de señales auxiliares para hacer interconexiones.
    signal ena_s  : std_logic;
    signal seg7_s : std_logic_vector(6 downto 0);

    --Declaración de señal auxiliar para negar la entrada BCD_in y hacer
    --interconexiones.
    signal BCDNot_s : std_logic_vector(3 downto 0);

    --Declaración de constante para guardar el valor de commonAnode del
    --top-level.
    constant topCommonAnode : BOOLEAN := commonAnode;

begin
    --Instanciación del decodificador interno e interconexión con señales
    --internas.
    BCDTo7seg_0: BCDTo7seg
        generic map (commonAnode => topCommonAnode)
        port map ( BCD_in   => BCDNot_s,
                   ena_in   => ena_s,
                   seg7_out => seg7_s );

    --Negación de la entrada BCD_in.
    BCDNot_s <= not BCD_in;

    --Interconexiones restantes.
    ena_s    <= ena_in;
    seg7_out <= seg7_s;
end architecture top_BCDTo7seg_arch;
