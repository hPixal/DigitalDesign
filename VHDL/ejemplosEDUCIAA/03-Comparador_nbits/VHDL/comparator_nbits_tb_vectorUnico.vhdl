--------------------------------------------------------------------------------
--- Entidad: comparatorNBits_tb_vectorUnico.
--- Descripción: Esta entidad es un testbench que permite verificar el
--               funcionamiento de un comparador de N bits por canal.
--               En este caso, N = 4.
--- Autor/es: Hernan Pablo Mendes Gouveia.
--- Ultima revisión: 06/06/2020.
--- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparatorNBits_tb_vectorUnico is
end entity comparatorNBits_tb_vectorUnico;

architecture comparatorNBits_tb_vectorUnico_arch of comparatorNBits_tb_vectorUnico is

    constant period : time:=100 ns;
    constant bits   : integer := 4;

    signal test_ch0      : std_logic_vector(bits-1 downto 0);
    signal test_ch1      : std_logic_vector(bits-1 downto 0);
    signal test_eq       : std_logic;
    signal test_ch1gtch0 : std_logic;
    signal test_ch1ltch0 : std_logic;

    -- Declarar un estimulo como un par de valores, uno por canal
    type stimulus is record
      ch0 : std_logic_vector(bits-1 downto 0);
      ch1 : std_logic_vector(bits-1 downto 0);
    end record stimulus;

    -- Declarar un vector de estimulos
    type stimulus_vec is array (8 downto 0) of stimulus;

    -- Instanciar un vector de estimulos
    constant dataTest_s : stimulus_vec := (
      ("0000","0000"),
      ("0101","1010"),
      ("1111","1111"),
      ("1000","0111"),
      ("0111","0111"),
      ("0110","0111"),
      ("0010","0000"),
      ("0000","0001"),
      ("0000","0000")
    );

    component comparatorNBits is
		--Bits por canal
		generic( bitsChannel : integer := 8);
		--Puertos de E/S
		port(
				ch0_in       : in std_logic_vector(bitsChannel-1 downto 0);
				ch1_in       : in std_logic_vector(bitsChannel-1 downto 0);
				eq_out       : out std_logic;
				ch1gtch0_out : out std_logic;
				ch1ltch0_out : out std_logic
		);
    end component;

begin
    --Instanciacion del DUT
    comparator : comparatorNBits generic map(bitsChannel=>bits)
                           port map(ch0_in=>test_ch0,
                                    ch1_in=>test_ch1,
                                    eq_out=>test_eq,
                                    ch1gtch0_out=>test_ch1gtch0,
                                    ch1ltch0_out=>test_ch1ltch0) ;

    -- Bombardear al DUT con estimulos
    simulate: process begin
        for i in 0 to ((dataTest_s'length - 1)) loop
            test_ch0 <= dataTest_s(i).ch0;
    	      test_ch1 <= dataTest_s(i).ch1;
            wait for period;
        end loop;
        wait;
    end process simulate;


end architecture comparatorNBits_tb_vectorUnico_arch;
