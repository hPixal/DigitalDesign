--------------------------------------------------------------------------------
--- Entidad: ALU_tb.
--- Descripción: Este testbench permite probar la ALU del Simple CPU v1.
--- Bibliografía: "Simple CPU v1", 9/10/2020,
--                https://creativecommons.org/licenses/by-nc-nd/4.0/
--- Autor: Matias Nicolas Costa.
--- Ultima revisión: 17/04/2021.
--- Dependencias: Paquetes std_logic_1164.all y numeric_std.all de la biblioteca
---               estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                --Biblioteca estándar IEEE.
use ieee.std_logic_1164.all; --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;     --Biblioteca de formatos numéricos
--Entidad del testbench.
entity ALU_tb is
end entity ALU_tb;

--Arquitectura del testbench.
architecture ALU_tb_arch of ALU_tb is
	--Declaración de la ALU a probar.
    component ALU
        generic (
            N_BITS : integer := 8
        );
        port (
            a_in    : in  std_logic_vector(N_BITS-1 downto 0);
            b_in    : in  std_logic_vector(N_BITS-1 downto 0);
            s0_in   : in  std_logic;
            s1_in   : in  std_logic;
            s2_in   : in  std_logic;
            s3_in   : in  std_logic;
            s4_in   : in  std_logic;
            z_out   : out std_logic_vector(N_BITS-1 downto 0);
            Car_out : out std_logic
        );
    end component ALU;

	--Declaración de constantes.
	constant DELAY    : time    := 100 ns;
    constant NUM_BITS : integer := 8;
    constant N_CONTROL: integer := 5; --Cantidad de lineas de control

    constant A1 : std_logic_vector := x"E8";
    constant B1 : std_logic_vector := x"22";

	--Declaración de estímulos y señal de monitoreo.
    signal stop_simulation_s : BOOLEAN := FALSE ;
	--Entradas a la ALU.
    signal test_a_s   : std_logic_vector(NUM_BITS-1 downto 0);
    signal test_b_s   : std_logic_vector(NUM_BITS-1 downto 0);
    signal test_s0_s  : std_logic;
    signal test_s1_s  : std_logic;
    signal test_s2_s  : std_logic;
    signal test_s3_s  : std_logic;
    signal test_s4_s  : std_logic;

	--Salidas de la ALU.
    signal test_z_s   : std_logic_vector(NUM_BITS-1 downto 0);
    signal test_Car_s : std_logic;
    --Linea de control auxiliar
    signal test_aux_control  : std_logic_vector(N_CONTROL-1 downto 0);

begin
	--Instanciación del DUT.
    ALU_0 : ALU
        generic map (
            N_BITS => NUM_BITS
        )
        port map (
            a_in    => test_a_s,
            b_in    => test_b_s,
            s0_in   => test_s0_s,
            s1_in   => test_s1_s,
            s2_in   => test_s2_s,
            s3_in   => test_s3_s,
            s4_in   => test_s4_s,
            z_out   => test_z_s,
            Car_out => test_Car_s
        );

  test_s0_s <= test_aux_control(0) ;
  test_s1_s <= test_aux_control(1) ;
  test_s2_s <= test_aux_control(2) ;
  test_s3_s <= test_aux_control(3) ;
  test_s4_s <= test_aux_control(4) ;

	--Proceso de aplicación de estímulos en la entrada del DUT.
	applyStimulus : process
	begin
        -- Loop para probar todas las entradas de los operandos
        testLoop : for i in 0 to (2**NUM_BITS)-1  loop
          -- para cada valor posible de la entrada se prueban todos los valores posibles de los operandos
          test_a_s <= std_logic_vector(to_unsigned(i,NUM_BITS)) ; -- desde 00 hasta FF
          test_b_s <= std_logic_vector(x"FF" - to_unsigned(i,NUM_BITS)) ; --desde FF hasta 00 para evitar ambiguedades
          -- se generan todos los valores posibles para las lineas de control
            controlSignalLoop : for j in 0 to (2**N_CONTROL)-1 loop
              test_aux_control <= std_logic_vector(to_unsigned(j,N_CONTROL)) ;
              -- Case para verificar las operaciones
              case( test_aux_control ) is

                  when "00000" => -- add
                                  assert(test_z_s = std_logic_vector(unsigned(test_a_s) + unsigned(test_b_s)))
                                  report "Fallo al procesar la suma"
                                  severity error;
                  when "00001" => -- bitwise and
                                  assert(test_z_s =( test_a_s and test_b_s)  )
                                  report "Fallo al procesar la bitwise and"
                                  severity error;
                  when "00010" => -- input A
                                  assert(test_z_s = test_a_s )
                                  report "Fallo al procesar la condicion de sacar a"
                                  severity error;
                  when "00011" => -- input B
                                  assert(test_z_s = test_b_s )
                                  report "Fallo al procesar la condicion de sacar b"
                                  severity error;
                  when "01100" => -- subtract
                                  assert(test_z_s = std_logic_vector(unsigned(test_a_s) - unsigned(test_b_s)))
                                  report "Fallo al procesar la resta"
                                  severity error;
                  when "10100" => -- increment (a+1)
                                  assert(test_z_s = std_logic_vector(unsigned(test_a_s) + 1))
                                  report "Fallo al procesar el incremento"
                                  severity error;
                  when "10000" => -- input A
                                  assert(test_z_s = test_a_s )
                                  report "Fallo al procesar la condicion de sacar a (con 10000)"
                                  severity error;
                  when "00100" => -- add (a+b)+1
                                  assert(test_z_s = std_logic_vector(unsigned(test_a_s) + 1 + unsigned(test_b_s)))
                                  report "Fallo al procesar el incremento de la suma"
                                  severity error;
                  when "01000" => -- subtract (a-b)-1
                                  assert(test_z_s = std_logic_vector(unsigned(test_a_s) - 1 - unsigned(test_b_s)))
                                  report "Fallo al procesar el incremento de la suma"
                                  severity error;
                  when others =>
              end case ;
              wait for DELAY ;
            end loop controlSignalLoop;
        wait for DELAY ;
        end loop  testLoop; -- testLoop
        stop_simulation_s <= TRUE;
        wait;
	end process applyStimulus;





end architecture ALU_tb_arch;
