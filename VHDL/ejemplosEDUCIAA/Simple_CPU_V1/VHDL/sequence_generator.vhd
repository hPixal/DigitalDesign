--------------------------------------------------------------------------------
--- Entidad: sequence_generator.
--- Descripción: Esta entidad es el generador de secuencia que va dentro del
---              decoder del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 3/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.

-- entidad
entity sequence_generator is
  port (
  clk_in         : in  std_logic ;
  clockEnable_in : in  std_logic ;
  rst_in         : in  std_logic ;
  fetch     : out std_logic ;
  decode    : out std_logic ;
  execute   : out std_logic ;
  increment : out std_logic
  );
end entity;

--Arquitectura.

architecture sequence_generator_arch of sequence_generator is
  --Seccion declarativa de señales internas al sequence generator
  --señal que contenera el bit que sera desplazado de modo similar a un contador en anillo
  signal vector_estados_s : std_logic_vector(3 downto 0) := "1000" ;

begin
  -- inicio del proceso secuencial de desplazamiento
  sequence_process : process(clk_in, rst_in, clockenable_in)
  begin
    if rst_in = '1' then
      vector_estados_s <= "1000" ;
    elsif clockEnable_in = '1' then
      if rising_edge(clk_in) then
        vector_estados_s (3 downto 0) <= vector_estados_s(0) & vector_estados_s (3 downto 1);
      end if;
    else

    end if;
  end process;
  -- asignacion de las salidas de fetch decode execute e increment a cada posicion del vector
  fetch     <= vector_estados_s (3);
  decode    <= vector_estados_s (2);
  execute   <= vector_estados_s (1);
  increment <= vector_estados_s (0);
end architecture;
