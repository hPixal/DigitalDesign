--------------------------------------------------------------------------------
--- Entidad: register_2bit.
--- Descripción: Esta entidad es un registro PIPO
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 3/04/2021.
--- Dependencias: Paquetes std_logic_1164.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;               --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all;--Paquete para std_logic y std_logic_vector.

--Entidad.

entity register_PIPO is
  generic (
          N_BITS          : integer := 2    ;
          risingEdgeClock : BOOLEAN := TRUE);
  port (
  clk_in : in std_logic ;
  clockEnable_in : in std_logic ;
  rst_in : in  std_logic ;
  d_in   : in  std_logic_vector(N_BITS-1 downto 0);
  d_out  : out std_logic_vector(N_BITS-1 downto 0)
  );
end entity;

--Arquitectura.
architecture register_PIPO_arch of register_PIPO is

  --señal auxiliar para almacenar la informacion de la salida
  signal d_out_s : std_logic_vector(N_BITS-1 downto 0) ;


begin
  --generacion del registro habilitado por flanco ascendente
  risingEdgeRegister: if (risingEdgeClock = TRUE) generate
      --proceso para cambiar la informacion de salida basado en las entradas
      risingEdgeRegisterData: process (clk_in, rst_in, clockenable_in)
      begin
          --reset asincronico
          if rst_in = '1' then
            d_out_s <= (others => '0');
          else
             if((rising_edge(clk_in)) and (clockEnable_in = '1')) then
                d_out_s <= d_in ;
             end if ;
          end if;
      end process risingEdgeRegisterData;
  end generate risingEdgeRegister;

  --generacion del registro habilitado por flanco descendente
  fallingEdgeRegister: if (risingEdgeClock = FALSE) generate
      --proceso para cambiar la informacion de salida basado en las entradas
      fallingEdgeRegisterData: process (clk_in, rst_in, clockenable_in)
      begin
          --reset asincronico
          if rst_in = '1' then
            d_out_s <= (others => '0');
          else
            if((falling_edge(clk_in)) and (clockEnable_in = '1')) then
             d_out_s <= d_in ;
          end if ;
          end if;
      end process fallingEdgeRegisterData;
  end generate fallingEdgeRegister;

  --asignacion de la salida
  d_out <= d_out_s ;


end architecture;
