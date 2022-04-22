--------------------------------------------------------------------------------
--- Entidad: univCounter.
--- Descripción: Esta entidad es un contador binario que cuenta los pulsos de su
--               entrada de reloj (clock). Este dispositivo tiene las siguientes
--               entradas y salidas:
--
--                  *clock_in: entrada de clock.
--                  *counterEnable_in: entrada de habilitación del contador.
--                  *load_in: entrada de habilitación de la carga paralela del
--                            contador.
--                  *d_in: entrada de dato para preconfigurar el conteo.
--                  *countUp_in: entrada para elegir si el conteo es ascendente
--                               o descendente.
--                  *outEnable_in: entrada asincrónica para habilitar la salida
--                                 del contador.
--                  *reset_in: entrada asincrónica para resetear el contador.
--                  *q_out: salida de dato binario que representa el conteo
--                          actual.
--                  *terminalCount_out: salida para poner varios de estos
--                                      contadores en cascada.
--
--               La salida "terminalCount_out" se pone en alto cuando el
--               contador está habilitado y la cuenta alcanza el valor final,
--               que es el 0 si la cuenta es descendente y el módulo (modulus)
--               menos uno si es ascendente. Dicha línea se utiliza para poner
--               varios de estos contadores en cascada y aumentar la cuenta
--               total. Para hacer esta conexión se recomienda ver el diagrama
--               esquemático explicado en la wiki de ejemplos y/o ver el
--               testbench "univCounter_tb_cascade.vhdl".
--
--               El valor del módulo, como así también la cantidad de bits de
--               entrada y salida y la activación por flanco de clock son
--               configurables.
--
--               La entrada de mayor jerarquía es la de habilitación de la
--               salida: si esta está en 1 la salida "q_out" se pone en alta
--               impedancia, sino esta tiene el conteo actual. Si la entrada de
--               reset está en 1 la salida "q_out" se pone en 0 sino esta
--               mantiene su valor. En este caso, si el conteo está habilitado,
--               la salida se carga con los datos de entrada "d_in" en caso de
--               que la carga paralela esté habilitada. Si esta no está
--               habilitada, la salida mantiene su valor hasta que suceda cierto
--               flanco de clock, para luego cambiar la cuenta según el sentido:
--               si es ascendente se incrementa hasta llegar a "modulus-1", para
--               luego resetearse a 0 y volver a empezar la cuenta; si es
--               descendente se decrementa hasta el 0, para luego resetearse en
--               "modulus-1" y volver a empezar la cuenta. Además, el contador
--               es autocorrejible, por lo que en caso de entrar en un estado
--               indeseado, luego de un pulso de clock se resetea a la secuencia
--               de cuenta correcta.
--
--               Siempre que se use este contador, al instanciarlo se debe
--               respetar que: modulus <= (2^nBits)
--
--               Este diseño está basado en los IC 74ALS160/1/2/3 y 74ALS190/1.
--- Autor: Federico Alejandro Vazquez Saraullo.
--- Ultima revisión: 11/01/2021.
--- Dependencias: Paquetes std_logic_1164.all y ieee.numeric_std.all de la
--				  biblioteca estándar ieee.
--------------------------------------------------------------------------------
--Inclusión de paquetes.
library ieee;                 --Biblioteca estándar ieee.
use ieee.std_logic_1164.all;  --Paquete para std_logic y std_logic_vector.
use ieee.numeric_std.all;     --Paquete para unsigned y signed.

--Declaración de la entidad.
entity univCounter is
    generic(
            nBits           : integer := 8;
            modulus         : integer := 256;
            risingEdgeClock : BOOLEAN := TRUE);
    port(
        d_in              : in  std_logic_vector(nBits-1 downto 0);
        clock_in          : in  std_logic;
        outEnable_in      : in  std_logic;
        reset_in          : in  std_logic;
        counterEnable_in  : in  std_logic;
        load_in           : in  std_logic;
        countUp_in        : in  std_logic;
        q_out             : out std_logic_vector(nBits-1 downto 0);
        terminalCount_out : out std_logic);
end entity univCounter;

--Declaración de la arquitectura.
architecture univCounter_arch of univCounter is
    --Señal auxiliar que almacena la cuenta actual del contador.
    signal counterData_cnt : unsigned(nBits-1 downto 0);
begin
    --Generación de un contador activado por flanco ascendente.
    risingEdgeCounter : if (risingEdgeClock = TRUE) generate
        --Proceso para cambiar el dato interno del contador según sus entradas.
        risingEdgeCounterData : process(clock_in, reset_in)
        begin
            if(reset_in = '1') then
                counterData_cnt <= (others => '0');
            elsif((rising_edge(clock_in)) and (counterEnable_in = '1')) then
                if(load_in = '1') then
                    counterData_cnt <= unsigned(d_in);
                else
                    case countUp_in is
                        when '0'    =>
                            --Cuenta descendente. Se considera que si el
                            --contador termina teniendo estados indeseados
                            --(de modulus a [2^nBits]-1) se autocorrige a
                            --"modulus - 1".
                            if(counterData_cnt = 0 or
                               counterData_cnt > (modulus - 1)) then
                                counterData_cnt <= to_unsigned(modulus - 1,
                                                               nBits);
                            else
                                counterData_cnt <= counterData_cnt - 1;
                            end if;
                        when '1'    =>
                            --Cuenta ascendente. Se considera que si el contador
                            --termina teniendo estados indeseados (de modulus a
                            --[2^nBits]-1) se autocorrige a 0.
                            if(counterData_cnt >= (modulus - 1)) then
                                counterData_cnt <= (others => '0');
                            else
                                counterData_cnt <= counterData_cnt + 1;
                            end if;
                        when others =>
                            counterData_cnt <= counterData_cnt;
                    end case;
                end if;
            end if;
        end process risingEdgeCounterData;
    end generate risingEdgeCounter;

    --Generación de un contador activado por flanco descendente.
    fallingEdgeCounter : if (risingEdgeClock = FALSE) generate
        --Proceso para cambiar el dato interno del contador según sus entradas.
        fallingEdgeCounterData : process(clock_in, reset_in)
        begin
            if(reset_in = '1') then
                counterData_cnt <= (others => '0');
            elsif((falling_edge(clock_in)) and (counterEnable_in = '1')) then
                if(load_in = '1') then
                    counterData_cnt <= unsigned(d_in);
                else
                    case countUp_in is
                        when '0'    =>
                            --Cuenta descendente. Se considera que si el
                            --contador termina teniendo estados indeseados
                            --(de modulus a [2^nBits]-1) se autocorrige a
                            --"modulus - 1".
                            if(counterData_cnt = 0 or
                               counterData_cnt > (modulus - 1)) then
                                counterData_cnt <= to_unsigned(modulus - 1,
                                                               nBits);
                            else
                                counterData_cnt <= counterData_cnt - 1;
                            end if;
                        when '1'    =>
                            --Cuenta ascendente. Se considera que si el contador
                            --termina teniendo estados indeseados (de modulus a
                            --[2^nBits]-1) se autocorrige a 0.
                            if(counterData_cnt >= (modulus - 1)) then
                                counterData_cnt <= (others => '0');
                            else
                                counterData_cnt <= counterData_cnt + 1;
                            end if;
                        when others =>
                            counterData_cnt <= counterData_cnt;
                    end case;
                end if;
            end if;
        end process fallingEdgeCounterData;
    end generate fallingEdgeCounter;

    --Asignación de la salida con la cuenta.
    q_out <= (others =>'Z') when outEnable_in = '0' else
             std_logic_vector(counterData_cnt);

    --Asignación de terminalCount_out.
    terminalCount_out <= '1' when (((counterData_cnt = (modulus-1)
                                    and countUp_in ='1')
                                  or (counterData_cnt = 0 and countUp_in = '0'))
                                and (counterEnable_in = '1')) else
                         '0';
end architecture univCounter_arch;
