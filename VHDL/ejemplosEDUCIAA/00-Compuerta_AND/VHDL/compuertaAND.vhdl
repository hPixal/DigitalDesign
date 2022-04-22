--------------------------------------------------------------------------------
--- Entidad: compuerta_and
--- Descripción: Esta entidad es una compuerta and de dos entradas de un bit.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 11/09/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity compuerta_and is
    port(
        a_in, b_in: in std_logic;
        q_out: out std_logic
    );
end compuerta_and;

architecture compuerta_and_arch of compuerta_and is
begin
    q_out <= a_in and b_in;
end compuerta_and_arch;
