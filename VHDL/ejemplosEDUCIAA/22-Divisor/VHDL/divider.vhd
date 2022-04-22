---------------------------------------------------------------------------
---- Entity:  divider                                                  ----
---- Description: Divider ip core                                      ----
---- Author/s:  Ramiro A. Ghignone, Martín A. Heredia                  ----
---- Last revision: 03/08/2020                                         ----
---- Dependencies:                                                     ----
----	IEEE.std_logic_1164                                            ----
----	IEEE.numeric_std                                               ----
----                                                                   ----
----                                                                   ----
---------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divider is
    generic (nBits : integer := 8);
    port(
        num_in : in unsigned(nBits-1 downto 0); --Numerador
        den_in : in unsigned(nBits-1 downto 0); --Denominador
        clk_in : in std_logic;
        rst_in_n : in std_logic;
        start_in : in std_logic;
        res_out : out unsigned(nBits-1 downto 0); --Resultado
        rmn_out : out unsigned(nBits-1 downto 0); --Remanente
        resultOk_out : out std_logic;
        divZero_out  : out std_logic;
        running_out   : out std_logic);
end entity divider;

architecture divider_arch of divider is
    --Conexiones del Datapath a la FSM
    signal is_zero_s : std_logic;
    signal iterate_ena : std_logic;
    --Conexiones de la FSM al Datapath
    signal load_ena : std_logic;
    signal divide_ena : std_logic;
    --Registros de entrada
    signal num_reg : unsigned(nBits-1 downto 0);
    signal den_reg : unsigned(nBits-1 downto 0);
    --Contador y registro del sustractor iterativo
    signal counter_cnt : unsigned(nBits-1 downto 0);
    signal iterate_reg : unsigned(nBits-1 downto 0);
    --Registros de estado actual y nuevo estado
    signal current_state : std_logic_vector(4 downto 0);
    signal next_state : std_logic_vector(4 downto 0);
    --Estados del sistema
    constant IDL : std_logic_vector(4 downto 0)  := "00000";--Idle
    constant LOAD : std_logic_vector(4 downto 0) := "10000";--Load
    constant CHK : std_logic_vector(4 downto 0)  := "01000";--Checking
    constant ERR : std_logic_vector(4 downto 0)  := "00100";--Error
    constant DIV : std_logic_vector(4 downto 0)  := "00010";--Dividing
    constant FINISHED : std_logic_vector(4 downto 0)  := "00001";--Finished
    --Constante nula
    constant ZERO : unsigned(nBits-1 downto 0) := (others=>'0');
begin

--Actualizacion de estados:
fsm_seq:
process (clk_in,rst_in_n)
begin
    --Accion de reset
    if (rst_in_n = '0') then
        current_state <= IDL;
    elsif (rising_edge(clk_in)) then
        --Actualizar el estado
        current_state <= next_state;
    end if;
end process fsm_seq;

--Sustractor iterativo
load_and_iterate:
process(clk_in, rst_in_n)
begin
    if(rst_in_n = '0') then
        num_reg <= ZERO;
        den_reg <= ZERO;
        counter_cnt <= ZERO;
        iterate_reg <= ZERO;
    elsif(rising_edge(clk_in)) then
        if(load_ena = '1') then
            num_reg <= num_in;
            den_reg <= den_in;
            iterate_reg <= num_in;
            counter_cnt <= ZERO;
        elsif(iterate_ena = '1' and divide_ena = '1') then
            iterate_reg <= iterate_reg - den_reg;
            counter_cnt <= counter_cnt + 1;
        end if;
    end if;
end process load_and_iterate;

--Proceso combinacional : comparacion del divisor con cero
is_den_zero:
process (den_reg)
begin
    if (den_reg = ZERO) then
        is_zero_s <= '1';
    else
        is_zero_s <= '0';
    end if;
end process is_den_zero;

--Proceso combinacional : comparacion de numerador y denominador
is_higher_than:
process (iterate_reg)
begin
    if (iterate_reg >= den_reg) then
        iterate_ena <= '1';
    else
        iterate_ena <= '0';
    end if;
end process is_higher_than;

--Registro de salida
output_reg:
process(clk_in,rst_in_n)
begin
    if(rst_in_n = '0') then
        res_out <= ZERO;
        rmn_out <= ZERO;
    elsif(rising_edge(clk_in)) then
        if (divide_ena = '1' and iterate_ena = '0') then
            res_out <= counter_cnt;
            rmn_out <= iterate_reg;
        end if;
    end if;
end process output_reg;

--Proceso combinacional : seleccion de la salida y del proximo estado segun estado actual
fsm_comb:
process (current_state,start_in,is_zero_s,iterate_ena)
begin
    case (current_state) is
        when IDL =>
            --Proximo estado
            if (start_in = '1') then
                next_state <= LOAD;
            else
                next_state <= IDL;
            end if;
            --Salidas de la FSM
            load_ena  <= '0';
            divide_ena <= '0';
            resultOk_out <= '0';
            running_out   <= '0';
            divZero_out  <= '0';

        when LOAD =>
            --Proximo estado
            next_state <= CHK;
            --Salidas de la FSM
            load_ena  <= '1';
            divide_ena <= '0';
            resultOk_out <= '0';
            running_out   <= '0';
            divZero_out  <= '0';

        when CHK =>
            --Proximo estado
            if (is_zero_s = '1') then
                next_state <= ERR;
            else
                next_state <= DIV;
            end if;
            --Salidas de la FSM
            load_ena  <= '0';
            divide_ena <= '0';
            resultOk_out <= '0';
            running_out   <= '1';
            divZero_out  <= '0';

        when ERR =>
            --Proximo estado
            next_state <= IDL;
            --Salidas de la FSM
            load_ena <= '0';
            divide_ena <= '0';
            resultOk_out <= '0';
            running_out <= '0';
            divZero_out <= '1';

        when DIV =>
            --Proximo estado
            if (iterate_ena = '1') then
                next_state <= DIV;
            else
                next_state <= FINISHED;
            end if;
            --Salidas de la FSM
            load_ena <= '0';
            divide_ena <= '1';
            resultOk_out <= '0';
            running_out <= '1';
            divZero_out <= '0';

        when FINISHED =>
            --Proximo estado
            next_state <= IDL;
            --Salidas de la FSM
            load_ena <= '0';
            divide_ena <= '0';
            resultOk_out <= '1';
            running_out <= '0';
            divZero_out <= '0';

        when others =>
            next_state <= IDL;
            load_ena <= '0';
            divide_ena <= '0';
            resultOk_out <= '0';
            running_out <= '0';
            divZero_out <= '0';

    end case;
end process fsm_comb;

end architecture divider_arch;
