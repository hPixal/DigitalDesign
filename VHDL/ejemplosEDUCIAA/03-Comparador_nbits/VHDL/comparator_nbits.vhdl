--------------------------------------------------------------------------------
--- Entidad: comparatorNBits.
--- Descripción: Esta entidad es un comparador de magnitud comparador de
--               magnitud cuyo número de bits en ambos canales es configurable.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 18/07/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--Entidad
entity comparatorNBits is
    --Bits por canal
    generic( bitsChannel : integer range 1 to 32 := 8);

    --Puertos de E/S
    port(
            ch0_in : in std_logic_vector(bitsChannel-1 downto 0);
            ch1_in : in std_logic_vector(bitsChannel-1 downto 0);
            eq_out : out std_logic;
            ch1gtch0_out : out std_logic;
            ch1ltch0_out : out std_logic
    );
end entity comparatorNBits;


--Arquitectura
architecture comparatorNBits_arch of comparatorNBits is

begin

    comp: process(ch0_in,ch1_in)
    begin

        if(ch0_in = ch1_in) then
        	eq_out <= '1';
        	ch1gtch0_out <= '0';
        	ch1ltch0_out <= '0';
        elsif(unsigned(ch0_in) < unsigned(ch1_in)) then
        	eq_out <= '0';
        	ch1gtch0_out <= '1';
        	ch1ltch0_out <= '0';
        else
        	eq_out <= '0';
        	ch1gtch0_out <= '0';
        	ch1ltch0_out <= '1';
        end if;
    end process comp;
end architecture comparatorNBits_arch;
