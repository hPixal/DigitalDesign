  --------------------------------------------------------------------------------
  --- Entidad: regSISO_tb_entradaSinc.
  --- Descripción: Esta entidad es un testbench que permite verificar el
  --               funcionamiento de un registro SISO de N bits.
  --               En este caso, N = 8.
  --               En este testbench los datos de entrada y el clk entán a
  --               a la misma frecuencia.
  --- Autor/es: Hernan Pablo Mendes Gouveia.
  --- Ultima revisión: 23/08/2020.
  --- Dependencias: Paquete std_logic_1164.all de la biblioteca estándar ieee.
  --                Paquete numeric_std.all de la biblioteca estándar ieee.
  --------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regSISO_tb_entradaSinc is
end entity regSISO_tb_entradaSinc;

architecture regSISO_tb_entradaSinc_arch of regSISO_tb_entradaSinc is

  --DEFINIR CONSTANTES
  constant periodClk  : time := 60 ns;
  constant periodData : time := 60 ns;
  constant bits   : integer := 8;

  signal test_clk : std_logic;
  signal test_rst : std_logic;
  signal test_ser : std_logic;
  signal test_q   : std_logic;

  signal dataTest_s : std_logic_vector(31 downto 0) := "01010110111000011101100010000100";

  signal test_stop : std_logic;

  component regSISO is
    --Cantidad de bits del registro
  	generic (Nbits : integer range 8 to 64 := 8);

  	--Puertos E/S
  	port(
  		clk_in : in std_logic;
  		rst_in : in std_logic;
  		ser_in : in std_logic;
  		q_out : out std_logic);
  end component;


begin
    --Instanciacion e interconexión del DUT
    reg : regSISO generic map(Nbits=>bits)
                  port map(clk_in=>test_clk,
                            rst_in=>test_rst,
                            ser_in=>test_ser,
                            q_out=>test_q) ;

    --Procesos de simulación

    --Proceso de reset inicial:
    process begin
        test_rst <= '1';
        wait for 2*periodClk; --El reset dura dos periods de clock
        test_rst <= '0';
        wait for periodClk;
        wait; --Bloquear al proceso
    end process;

    --Proceso de generación de clock
    process begin
        test_clk <= '1';
        wait for periodClk/2;
        test_clk <= '0';
        wait for periodClk/2;
        if (test_stop='1') then
            wait;
        end if;
    end process;

    --Proceso de generación de entradas
    process begin
        test_stop <= '0';
        for i in 0 to ((dataTest_s'length - 1)) loop
          test_ser <= dataTest_s(i);
          wait for periodData;
        end loop;
        test_stop <= '1';
        wait;
    end process;

end architecture regSISO_tb_entradaSinc_arch;
