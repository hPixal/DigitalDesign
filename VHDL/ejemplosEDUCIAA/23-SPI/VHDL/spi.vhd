--------------------------------------------------------------------------
---- Entity:  spi                                                     ----
---- Description: SPI Master core configurable in 4 operating modes   ----
---- Author/s:  Martín A. Heredia                                     ----
---- Last revision: 02/09/2020                                        ----
---- Dependencies:                                                    ----
----	IEEE.std_logic_1164                                           ----
----	IEEE.numeric_std                                              ----
----	IEEE.math_real                                                ----
----                                                                  ----
----                                                                  ----
--------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity spi is
generic(
    dataBits : integer range 4 to 32 := 8;
		cPol : std_logic := '1';
		cPha : std_logic := '1';
    csPol : std_logic := '0');
port(
    clk_in : in std_logic; --Entrada de clock
    rst_in_n : in std_logic; --Entrada de reset negado
    drdy_in : in std_logic; --Entrada drdy_in, la cual indica que hay datos disponibles para leer
    serialD_in : in std_logic; --MISO
    serialD_out : out std_logic; --MOSI
    cs_out : out std_logic; --Chip select
    sclk_out : out std_logic; --Salida SCLK para lectura/escritura
		dataReceived_out : out std_logic; --Indicación de datos recibidos
    shifting_out : out std_logic; --Salida que indica transmisión en curso
		write_in : in std_logic; --Señal para comenzar proceso de transmisión de datos (escritura)
		data_in : in std_logic_vector(dataBits-1 downto 0); --Entrada de datos para Tx
    data_out : out std_logic_vector(dataBits-1 downto 0)); --Datos recibidos
end entity spi;

architecture spi_arch of spi is
    ----Chip Select y flancos de lectura y desplazamiento----
    constant SHIFT_OUT_EDGE : std_logic := (cPol xor cPha);
		constant SHIFT_IN_EDGE : std_logic := not(SHIFT_OUT_EDGE);
    constant CS_ACTIVE : std_logic := csPol;
    constant CS_INACTIVE : std_logic := not(csPol);
    ----SCKL----
    signal sclk : std_logic;
    signal sclkOutput_ena : std_logic;
    signal sclkOutputSelect_s : std_logic;
    constant PULSE_CNTR_N_BITS : integer := integer(ceil(log2(real(dataBits))));
    signal pulseCounter_cnt : unsigned(PULSE_CNTR_N_BITS-1 downto 0);
    signal pulseCounterTC_s : std_logic;
		----Registro de entrada----
		signal din_reg : std_logic_vector(dataBits-1 downto 0);
		signal loadDin_ena : std_logic;
		----Registro de salida----
		signal dout_reg : std_logic_vector(dataBits-1 downto 0);
    signal loadDout_ena : std_logic;
    ----Registro de desplazamiento----
    signal shift_reg : std_logic_vector(dataBits-1 downto 0);
    signal shiftBitsIn_s : unsigned(dataBits-1 downto 0);
    signal shiftLoad_ena_n : std_logic;
    signal shift_ena : std_logic;
    signal dataReceived_s : std_logic;
		----Estados de la FSM----
    type fsmd_states is (IDLE, LOAD_INPUT, LOAD_SR, CSELECT, SHIFT, DONE, CNOTSELECT);
    signal currentState_s, nextState_s : fsmd_states;
begin

    --Salidas
    sclk_out <= sclk;
    sclkOutputSelect_s <= (sclkOutput_ena) and (not pulseCounterTC_s);
    with sclkOutputSelect_s select
        sclk <=
            clk_in when '1',
            cPol when others;

    data_out <= dout_reg;

    --Contar pulsos de clock en funcion del modo SPI
    count_clock_pulses:
    process(clk_in)
    begin
        if(clk_in'event and clk_in=cPol) then
            if(sclkOutput_ena = '0') then
                pulseCounter_cnt <= (others => '0');
                pulseCounterTC_s <= '0';
            else
                if(pulseCounter_cnt = dataBits-1) then
                    pulseCounter_cnt <= (others => '0');
                    pulseCounterTC_s <= '1';
                else
                   pulseCounter_cnt <= pulseCounter_cnt + 1;
                   pulseCounterTC_s <= '0';
                end if;
            end if;
        end if;
    end process count_clock_pulses;

    --Registro de desplazamiento
    do_shift_in:
    process(clk_in,rst_in_n)
    begin
        if(rst_in_n = '0') then
            shift_reg <= (others => '0');
            shiftBitsIn_s <= (others => '0');
            dataReceived_s <= '0';
        elsif(clk_in'event and clk_in=SHIFT_IN_EDGE) then
            if(shiftLoad_ena_n = '0') then
                shift_reg <= din_reg;
                shiftBitsIn_s <= (others => '0');
                dataReceived_s <= '0';
            elsif(shift_ena = '1') then
                shift_reg <= shift_reg(dataBits-2 downto 0)&serialD_in;
	              if(shiftBitsIn_s = dataBits-2) then
		                dataReceived_s <= '1';
                    shiftBitsIn_s <= shiftBitsIn_s+1;
                elsif(shiftBitsIn_s = dataBits-1) then
                    dataReceived_s <= '0';
                    shiftBitsIn_s <= (others => '0');
		            else
	                  dataReceived_s <= '0';
                    shiftBitsIn_s <= shiftBitsIn_s+1;
	              end if;
            end if;
        end if;
    end process do_shift_in;

    --Registro de entrada
    input_register:
    process(clk_in,rst_in_n)
    begin
        if(rst_in_n = '0') then
              din_reg <= (others => '0');
        elsif(clk_in'event and clk_in=SHIFT_IN_EDGE) then
            if(loadDin_ena = '1') then
                din_reg <= data_in;
            end if;
        end if;
    end process input_register;

    --Registro de salida
	  output_register:
	  process(clk_in,rst_in_n)
	  begin
        if(rst_in_n = '0') then
				    dout_reg <= (others => '0');
        elsif(clk_in'event and clk_in=SHIFT_IN_EDGE) then
            if(loadDout_ena = '1') then
  		          dout_reg <= shift_reg;
  		      end if;
  	    end if;
	  end process output_register;

	  --Desplazamiento de salida con FF D
	  do_shift_out:
	  process(clk_in,rst_in_n)
	  begin
	      if(rst_in_n = '0') then
            serialD_out <= '0';
        elsif(clk_in'event and clk_in=SHIFT_OUT_EDGE) then
            serialD_out <= shift_reg(dataBits-1);
        end if;
    end process do_shift_out;

    --Parte secuencial de la FSM
		sequential:
    process(clk_in,rst_in_n)
    begin
		    if(rst_in_n = '0') then
			      currentState_s <= IDLE;
        elsif(clk_in'event and clk_in=SHIFT_IN_EDGE) then
			      currentState_s <= nextState_s;
		    end if;
    end process sequential;

    --Parte combinacional de la FSM
    combinational:
    process(currentState_s,drdy_in,write_in,dataReceived_s)
    begin
        case currentState_s is
            when IDLE =>
                if(write_in = '1') then
                    nextState_s <= LOAD_INPUT;
                elsif(drdy_in = '0') then
                    nextState_s <= CSELECT;
                else
                    nextState_s <= IDLE;
                end if;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= '0';
                sclkOutput_ena <= '0';
                loadDin_ena <= '0';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_INACTIVE;
                shifting_out <= '0';

            when LOAD_INPUT =>
                nextState_s <= LOAD_SR;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= '0';
                sclkOutput_ena <= '0';
                loadDin_ena <= '1';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_INACTIVE;
                shifting_out <= '0';

            when LOAD_SR =>
                nextState_s <= CSELECT;
                --Señales de control
                shiftLoad_ena_n <= '0';
                shift_ena <= '0';
                sclkOutput_ena <= '0';
                loadDin_ena <= '0';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_INACTIVE;
                shifting_out <= '0';

            when CSELECT =>
                nextState_s <= SHIFT;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= not(cPha); --En caso de realizar la lectura de datos
                                        --con el primer flanco de sclk_out (cPha = '0'),
                                        --el registro de desplazamiento debe habilitarse
                                        --un ciclo de clock antes del estado SHIFT. De lo contrario,
                                        --si cPha = '1', el registro de desplazamiento se habilita
                                        --en el estado SHIFT
                sclkOutput_ena <= '0';
                loadDin_ena <= '0';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_ACTIVE;
                shifting_out <= '0';

            when SHIFT =>
                if(dataReceived_s = '1') then
                    nextState_s <= DONE;
                else
                    nextState_s <= SHIFT;
                end if;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= '1';
                sclkOutput_ena <= '1';
                loadDin_ena <= '0';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_ACTIVE;
                shifting_out <= '1';

            when DONE =>
                nextState_s <= CNOTSELECT;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= '0';
                sclkOutput_ena <= not(cPha); --En los casos donde cPha = '1', el último
                                             --flanco de clock se utiliza para leer datos,
                                             --de esta forma, sclk_out vuelve al estado idle
                                             --luego de la última lectura. Por el contrario,
                                             --cuando el modo de funcionamiento está definido con
                                             --cPha = '0', el último flanco del sclk_out se usa para
                                             --desplazar el próximo bit de datos (tanto en Master
                                             --como en Slave), es decir que luego de leer el último
                                             --bit, es necesario un flanco adicional en sclk_out para
                                             --realizar esto último.
                loadDin_ena <= '0';
                loadDout_ena <= '1';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_ACTIVE;
                shifting_out <= '0';

            when CNOTSELECT =>
                if(drdy_in = '1') then
                    nextState_s <= IDLE;
                else
                    nextState_s <= CNOTSELECT;
                end if;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= '0';
                sclkOutput_ena <= '0';
                loadDin_ena <= '0';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '1';
                cs_out <= CS_INACTIVE;
                shifting_out <= '0';

            when others =>
                nextState_s <= IDLE;
                --Señales de control
                shiftLoad_ena_n <= '1';
                shift_ena <= '0';
                sclkOutput_ena <= '0';
                loadDin_ena <= '0';
                loadDout_ena <= '0';
                --Salidas
                dataReceived_out <= '0';
                cs_out <= CS_INACTIVE;
                shifting_out <= '0';

        end case;
    end process combinational;

end architecture spi_arch;
