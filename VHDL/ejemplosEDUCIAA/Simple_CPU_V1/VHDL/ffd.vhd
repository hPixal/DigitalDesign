--------------------------------------------------------------------------------
--- Entidad: ffd.
--- Descripción:Esta entidad es un Flip-Flop D cuya activacion es reprogramable
---             setteada por defecto en activacion por flanco ascendente
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 4/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------

-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.


--Entidad.
entity ffd is
  generic (risingEdgeClock : BOOLEAN := TRUE);
  port (
  clk_in : in std_logic ;
  rst_in : in std_logic ;
  clk_ena: in std_logic ;
  d_in   : in std_logic ;
  d_out  : out std_logic
  );
end entity ffd;

--Arquitectura.
architecture ffd_arch of ffd is

begin
  --generacion del flip flop habilitado por flanco ascendente
  risingEdgeFlipFlop : if (risingEdgeClock = TRUE ) generate
    --proceso para cambiar la informacion de salida basado en la entrada
    risingEdgeProcess : process(clk_in, rst_in, clk_ena)
    begin
      --reset asincronico
      if rst_in = '1' then
        d_out <= '0' ;
      --activacion por flanco de subida
      elsif ((rising_edge(clk_in)) and (clk_ena='1')) then
        d_out <= d_in ;
      end if;
    end process;
  end generate;

  --generacion del flip flop habilitado por flanco descendente
  fallingEdgeFlipFlop : if (risingEdgeClock = FALSE ) generate
    --proceso para cambiar la informacion de salida basado en la entrada
    risingEdgeProcess : process(clk_in, rst_in, clk_ena)
    begin
      --reset asincronico
      if rst_in = '1' then
        d_out <= '0' ;
      --activacion por flanco de bajada
      elsif ((falling_edge(clk_in)) and (clk_ena='1')) then
        d_out <= d_in ;
      end if;
    end process;
  end generate;


end architecture ffd_arch;
