--------------------------------------------------------------------------------
--- Entidad: top_comp1bit.
--- Descripción: Esta entidad es un comparador de magnitud de 1 bit hecho
--               especialmente para la EDU-CIAA-FPGA. La entidad es de tipo
--               "wrapper" ya que instancia un bloque "comp1bit" en su interior
--               y lo interconecta con sus propios puertos de entrada y salida,
--               teniendo en cuenta que dichas entradas son negadas
--               internamente para contrarrestar el efecto de los resistores
--               pull-up conectados a los pulsadores de la placa.
--- Autor/es: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity top_comp1bit is
    port(
        a_in   : in  std_logic;
        b_in   : in  std_logic;
        eq_out : out std_logic;
        gt_out : out std_logic;
        lt_out : out std_logic
    );
end entity top_comp1bit;

--Declaración de la arquitectura.
architecture top_comp1bit_arch of top_comp1bit is
    --Declaración del comparador de magnitud interno a instanciar.
    component comp1bit is
        port (
            a_in   : in  std_logic;
            b_in   : in  std_logic;
            eq_out : out std_logic;
            gt_out : out std_logic;
            lt_out : out std_logic
        );
    end component;

    --Declaración de señales auxiliares para hacer interconexiones.
    signal eq_s : std_logic;
    signal gt_s : std_logic;
    signal lt_s : std_logic;

    --Declaración de señales auxiliares para negar las entradas y hacer
    --interconexiones.
    signal aNot_s : std_logic;
    signal bNot_s : std_logic;

begin
    --Instanciación del comparador de magnitud interno e interconexión con
    --señales internas.
    comp1bit_0 : comp1bit
        port map ( a_in   => aNot_s,
                   b_in   => bNot_s,
                   eq_out => eq_s,
                   gt_out => gt_s,
                   lt_out => lt_s);

    --Negación de las entradas a_in y b_in.
    aNot_s <= not a_in;
    bNot_s <= not b_in;

    --Conexión de los puertos de salida con señales internas.
    eq_out <= eq_s;
    gt_out <= gt_s;
    lt_out <= lt_s;
end architecture top_comp1bit_arch;
