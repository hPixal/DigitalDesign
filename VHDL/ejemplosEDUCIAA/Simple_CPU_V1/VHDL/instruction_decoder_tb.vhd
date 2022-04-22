--------------------------------------------------------------------------------
--- Entidad: instruction_decoder_tb.
--- Descripción: Este testbench permite probar elinstruction decoder que
---              va dentro del decoder del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 2/04/2021.
--- Dependencias: Paquetes std_logic_1164.all y numeric_std.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
-- Inclusión de paquetes
library ieee;                 --Estándar IEEE
use ieee.std_logic_1164.all;  --Biblioteca std_logic
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos

-- entidad del testbench
entity instruction_decoder_tb is
end entity instruction_decoder_tb;

--Arquitectura del testbench.
architecture instruction_decoder_tb_arch of instruction_decoder_tb is
  --Declaración del instruction decoder a probar
    component instruction_decoder is
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
end component instruction_decoder;

  --Declaración de las constantes.
	constant DELAY    : time    := 100 ns;
  constant NUM_BITS : integer := 8;

  --Declaracion de los estimulos.
  signal test_a_in_s        :  std_logic_vector(NUM_BITS-1 downto 0);
  signal test_add_s         :  std_logic ;
  signal test_load_s        :  std_logic ;
  signal test_output_out_s  :  std_logic ;
  signal test_input_out_s   :  std_logic ;
  signal test_jumpz_s       :  std_logic ;
  signal test_jump_s        :  std_logic ;
  signal test_jumpnz_s      :  std_logic ;
  signal test_jumpc_s       :  std_logic ;
  signal test_jumpnc_s      :  std_logic ;
  signal test_sub_s         :  std_logic ;
  signal test_bitand_s      :  std_logic ;

begin

  -- Instanciación e interconexion de la DUT
  dut : instruction_decoder generic map (N_BITS => NUM_BITS)
                            port map (
                                a_in     =>  test_a_in_s ,
                                add      =>  test_add_s ,
                                load     =>  test_load_s ,
                                output_out => test_output_out_s  ,
                                input_out  => test_input_out_s   ,
                                jumpz    => test_jumpz_s    ,
                                jump     => test_jump_s     ,
                                jumpnz   => test_jumpnz_s   ,
                                jumpc    => test_jumpc_s    ,
                                jumpnc   => test_jumpnc_s   ,
                                sub      => test_sub_s      ,
                                bitand   => test_bitand_s
                            );
  -- Estimulos
  --Proceso de generación de la entrada
  applyStimulus : process
  begin
    -- loop para probar todos los valores posibles para la entrada de 8 bits
    testLoop : for i in 0 to (2**NUM_BITS)-1 loop
      test_a_in_s <= std_logic_vector(to_unsigned(i,NUM_BITS)) ;
      -- case para probar las operaciones detectadas con los primeros 4 bits
      case( test_a_in_s(NUM_BITS-1 downto NUM_BITS/2) ) is
        when "0000" => -- load
                            assert (test_load_s = '1')
                            report "Fallo al detectar condicion de Load"
                            severity error;
        when "0100" => -- add
                            assert (test_add_s = '1')
                            report "Fallo al detectar condicion de Add"
                            severity error;
        when "0001" => -- And
                            assert (test_bitand_s = '1')
                            report "Fallo al detectar condicion de And"
                            severity error;
        when "0110" => -- Sub
                            assert (test_sub_s = '1')
                            report "Fallo al detectar condicion de Sub"
                            severity error;
        when "1010" => -- Input
                            assert (test_input_out_s = '1')
                            report "Fallo al detectar condicion de Input"
                            severity error;
        when "1110" => -- Output
                            assert (test_output_out_s = '1')
                            report "Fallo al detectar condicion de Output"
                            severity error;
        when "1000" => -- Jump U
                            assert (test_jump_s = '1')
                            report "Fallo al detectar condicion de Salto incondicional"
                            severity error;
        when others =>
      end case;
      -- case para probar las operaciones detectadas con los primeros 6 bits
      case( test_a_in_s(NUM_BITS-1 downto NUM_BITS-6) ) is
        when "100100" => -- Jump Z
                            assert (test_jumpz_s = '1')
                            report "Fallo al detectar condicion de Salto por deteccion de cero"
                            severity error;
        when "100110" => -- Jump C
                            assert (test_jumpc_s = '1')
                            report "Fallo al detectar condicion de Salto por deteccion de carry"
                            severity error;
        when "100101" => -- Jump NZ
                            assert (test_jumpnz_s = '1')
                            report "Fallo al detectar condicion de Salto por no deteccion de cero"
                            severity error;
        when "100111" => -- Jump NC
                            assert (test_jumpnc_s = '1')
                            report "Fallo al detectar condicion de Salto por no deteccion de carry"
                            severity error;
        when others =>
      end case ;
      -- Delay para la aplicacion del siguiente estimulo
      wait for DELAY ;
    end loop;
    -- se detiene la simulacion una vez aplicados todos los estimulos
    wait ;
  end process;

end architecture;
