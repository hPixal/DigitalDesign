--------------------------------------------------------------------------------
--- Entidad: flipflop_d
--- Descripción: Esta entidad es un FF tipo D. La salida Q cambiará al mismo
--               estado esté presente en la entrada DATA cuando ocurra una
--               transición de pendiente positiva en el CLK.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 11/07/2020.
--- Dependencias: Paq_outuete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--Entidad
entity flipflop_d is
    port (
        clk_in : in  std_logic;
        data_in  : in  std_logic;
        rst_in : in  std_logic;
        q_out   : out std_logic
    );
end entity flipflop_d;

--Arquitectura
architecture flipflop_d_arch of flipflop_d is
begin

    process (clk_in,rst_in) begin
        if(rst_in='1')then
            q_out <= '0';
        elsif(rising_edge(clk_in))then
            q_out <= data_in;
        end if;
    end process;

end architecture flipflop_d_arch;
