--------------------------------------------------------------------------------
--- Entidad: instruction_decoder.
--- Descripción: Esta entidad es el instruction decoder que va dentro del
---              decoder del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 2/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.


--Entidad.
entity instruction_decoder is
  generic( N_BITS : integer := 8 );
  port (
  a_in        : in  std_logic_vector(N_BITS-1 downto 0);
  add         : out std_logic ;
  load        : out std_logic ;
  output_out  : out std_logic ;
  input_out   : out std_logic ;
  jumpz       : out std_logic ;
  jump        : out std_logic ;
  jumpnz      : out std_logic ;
  jumpc       : out std_logic ;
  jumpnc      : out std_logic ;
  sub         : out std_logic ;
  bitand      : out std_logic
  );
end entity;

--Arquitectura.
architecture instruction_decoder_arch of instruction_decoder is
--Seccion declarativa de señales internas al instruction decoder
--señal para las operaciones AND de la generacion de condiciones de salto
  signal jump_condition : std_logic ;

begin
  -- Proceso combinacional referido a las instrucciones del Simple CPU v1.
  -- operación INPUT.
  input_out  <=  a_in(7) and (not a_in(6)) and a_in(5) and (not a_in(4));
  -- operación OUTPUT.
  output_out <=  a_in(7) and a_in(6) and a_in(5) and (not a_in(4));
  -- operación LOAD.
  load <= (not a_in(7)) and (not a_in(6)) and (not a_in(5)) and (not a_in(4));
  -- operación ADD.
  add <= (not a_in(7)) and  a_in(6) and (not a_in(5)) and (not a_in(4));
  -- operación de salto incondicional.
  jump <=  a_in(7) and (not a_in(6)) and (not a_in(5)) and (not a_in(4));
  -- generacion de la señal para las condiciones de salto.
  jump_condition <=  a_in(7) and (not a_in(6)) and (not a_in(5)) and a_in(4);
  -- operación de sustracción.
  sub <= (not a_in(7)) and  a_in(6) and a_in(5) and (not a_in(4));
  -- operación AND a nivel bit.
  bitand <= (not a_in(7)) and (not a_in(6)) and (not a_in(5)) and a_in(4);
  -- operación de salto si se genero un cero a la salida de la ALU.
  jumpz <= jump_condition and (not a_in (3)) and (not a_in(2)) ;
  -- operación de salto si NO se genero un cero a la salida de la ALU.
  jumpnz <= jump_condition and (not a_in (3)) and  a_in(2) ;
  -- operación de salto si se genero carry de la ultima operacion de la ALU.
  jumpc  <= jump_condition and a_in (3) and (not a_in(2));
  -- operación de salto si NO se genero carry de la ultima operacion de la ALU.
  jumpnc <= jump_condition and  a_in (3) and a_in(2) ;

end architecture;
