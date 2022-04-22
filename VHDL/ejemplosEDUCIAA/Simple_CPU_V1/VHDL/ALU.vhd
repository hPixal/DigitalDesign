--------------------------------------------------------------------------------
--- Entidad: ALU.
--- Descripción: Esta entidad es la ALU del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 27/02/2021.
--- Dependencias: Paquetes std_logic_1164.all y numeric_std.all de la biblioteca
--                estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee; 				 --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;    --Paquete para signed y unsigned.

--Entidad.
entity ALU is
    generic(
        N_BITS : integer := 8
    );
    port(
        a_in    : in  std_logic_vector(N_BITS-1 downto 0);
        b_in    : in  std_logic_vector(N_BITS-1 downto 0);
        s0_in   : in  std_logic;
        s1_in   : in  std_logic;
        s2_in   : in  std_logic;
        s3_in   : in  std_logic;
        s4_in   : in  std_logic;
        z_out   : out std_logic_vector(N_BITS-1 downto 0);
        Car_out : out std_logic
    );
end entity ALU;

--Arquitectura
architecture ALU_arch of ALU is
    --Señales para MUX de salida.
    signal muxSel_s : std_logic_vector(1 downto 0);
    signal muxOut_s : std_logic_vector(N_BITS-1 downto 0);

    --Señales para el sumador.
    signal expandA_s      : unsigned(N_BITS downto 0);
    signal expandAndOp1_s : unsigned(N_BITS downto 0);
    signal expandS2_s     : unsigned(N_BITS downto 0);
    signal expandSum_s    : unsigned(N_BITS downto 0);
    signal adderSum_s     : std_logic_vector(N_BITS-1 downto 0);

    --Señales para la operación AND 1.
    signal andOp1_s   : std_logic_vector(N_BITS-1 downto 0);
    signal expandS3_s : std_logic_vector(N_BITS-1 downto 0);
    signal expandS4_s : std_logic_vector(N_BITS-1 downto 0);

    --Señales para la operación AND 2.
    signal andOp2_s : std_logic_vector(N_BITS-1 downto 0);

    --Constantes para legibilidad del código.
    constant ZERO : std_logic_vector(N_BITS-1 downto 0) := (others => '0');

begin
    --Operador AND 1.
    expandS3_s <= s3_in & s3_in & s3_in & s3_in & s3_in & s3_in & s3_in & s3_in;
    expandS4_s <= s4_in & s4_in & s4_in & s4_in & s4_in & s4_in & s4_in & s4_in;
    andOp1_s   <= (not expandS4_s) and (b_in xor expandS3_s);

    --Operador AND 2.
    andOp2_s <= a_in and b_in;

    --Lógica y conexiones del sumador.
    expandA_s      <= unsigned('0' & a_in);
    expandAndOp1_s <= unsigned ('0' & andOp1_s);
    expandS2_s     <= unsigned(ZERO(N_BITS-1 downto 0) & s2_in);
    expandSum_s    <= (expandA_s + expandAndOp1_s + expandS2_s);
    adderSum_s     <= std_logic_vector(expandSum_s(N_BITS-1 downto 0));
    Car_out        <= expandSum_s(N_BITS);

    --Conexiones del MUX.
    muxSel_s <= s1_in & s0_in;

    with muxSel_s select
        muxOut_s <= adderSum_s when "00",
                    andOp2_s   when "01",
                    a_in       when "10",
                    b_in       when others; --Por defecto.

    z_out <= muxOut_s;

end architecture ALU_arch;
