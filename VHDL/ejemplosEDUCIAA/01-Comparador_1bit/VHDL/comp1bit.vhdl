--------------------------------------------------------------------------------
--- Entidad: comp1bit.
--- Descripción: Esta entidad es una comparador de magnitud de 1 bit. Este
--               analiza 2 bits de entrada, y determina cual es mayor o si ambos
--               son iguales.
--- Autor/es: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 06/01/2021.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.

--Declaración de la entidad.
entity comp1bit is
    port(
        a_in   : in  std_logic;
        b_in   : in  std_logic;
        eq_out : out std_logic;
        gt_out : out std_logic;
        lt_out : out std_logic
    );
end entity comp1bit;

--Declaración de la arquitectura.
architecture comp1bit_arch of comp1bit is
    --Declaración de señales auxiliares que representan minitérminos.
    signal minterm0_s : std_logic;
    signal minterm1_s : std_logic;
begin
    --Obtención de cada minitérmino.
    minterm0_s <= (not a_in) and (not b_in);
    minterm1_s <= a_in and b_in;

    --Cada salida se asigna según la primer forma canónica.
    eq_out <= minterm0_s or minterm1_s;
    lt_out <= (not a_in) and b_in;
    gt_out <= a_in and (not b_in);
end architecture comp1bit_arch;
