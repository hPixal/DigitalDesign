# Softcore Toplevel

* [Volver atras](../../README.md)

[[_TOC_]]

Teniendo ya la ALU y el Decoder las cuales eran las únicas piezas cuyas descripciones no se encontraban documentadas dentro de este repositorio, pasamos a crear el toplevel de todo el softcore.

Pasemos a analizar el circuito para comprender lo que luego codificaremos en VHDL.
Podemos identificar el componente por el nombre de su habilitación y/o linea de control, por ejemplo, el clock enable del **P**rogram **C**ounter se llama EN_PC.

## Registros

- Program Counter o PC: guarda la dirección de memoria a donde está la instrucción que sé está siguiendo, este habilita su clock, como podemos ver en la tabla anterior, cuando estamos en la etapa de Increment y toma su entrada de la salida de la ALU, la cual es la que se encarga de incrementar en 1 la dirección en donde estamos parados.
- Instruction Register o IR **(16 BITS)**: El registro de instrucciones está directamente conectado a la salida de la RAM, aqui es  por donde pasan todas las instrucciones que le vamos a indicar al procesador, luego de ahí se dividen en la parte que describe la instrucción (los 8 bits más significativos que van al decoder) y la parte que trae el valor numérico con el cual se ejecuta esa instrucción(los 8 bits menos significativos), esta ultima puede ser un numero, una posición de la RAM o una dirección, de acuerdo con la tabla de instrucciones, debido a esto, su salida se divide en dos y la parte más significativa va al decoder, mientras que la menos significativa va al mux que genera el sumando B de la ALU (**MUXB**) y al mux que selecciona, de haberla, la dirección de la RAM (**MUXC**) mediante su entrada **address_in**
- Data Accumulator o DA: es el registro que almacena las salidas de la ALU, es en el cual guardamos los datos que queremos cuando utilizamos la operación Load o Input.

## Flip Flops D 

- FD: El Flip Flop de la entrada del sistema el cual recibe como input al clear, su objetivo es generar una especie de reset sincronico.
- FDCE: El Flip Flop que almacena el dato de salida serial, este se activa cuando se llama a la direccion de la RAM 0xFF y recibe el bit mas significativo de la instruccion que sale de la memoria. Este componente no es incluido en la implementacion final sino que es reemplazado con una UART. 

## Multiplexores
- MUXA : Como su nombre lo indica, selecciona segun una linea de control el sumando A de la ALU, es un multiplexor de dos entradas y 8 bits, su primer entrada es la salida del acumulador y la segunda entrada es la salida del program counter, mediante este multiplexor cuando su linea de selección se pone en 1 es que se ejecuta el incremento del de la dirección de memoria.
- MUXB: De la misma forma que el anterior, selecciona entre dos entradas de 8 bits según una linea de control y genera el sumando B de la ALU, en su primera entrada recibe los 8 bits menos significativos de la palabra de 16 bits que sale de la RAM, es decir que su contenido puede ser una posición de memoria, una posición de la RAM o un numero entero de 8 bits, como segunda entrada recibe los 8 bits menos significativos del instruction register, debido a la presencia del registro, sus valores no son necesariamente iguales, sino que el registro se encarga de almacenar una instruccion mientras que en la entrada del primero la instruccion no fue almacenada sino que fue directamente hacia el multiplexor esto resulta util para operaciones como input, output o cualquiera de los saltos condicionales, ya que en estas la dirección que va a llegar a la salida de la ALU vuelve al PC.
- MUXC: Este elige la siguiente dirección que se colocara en la entrada de la RAM, útil para las operaciones de salto, input o output ya que se deberá seleccionar ir hacia una dirección de memoria.

**Nota**: Notese que a la salida del acumulador se le rellenan los 8 bits mas significativos, esto se debe a que la RAM tiene una longitud de palabra de 16 bits y el procesador trabaja con 8.

## Entidad del Toplevel

```vhdl
--Entidad.
entity softcore is
  generic(
    cpu_data_word_length : integer := 8
  );
  port (
  clock_in   : in  std_logic ;
  clr_in     : in  std_logic ;
  cpu_out    : out std_logic_vector(cpu_data_word_length-1 downto 0);
  chip_en    : in  std_logic ;
  serial_we  : out std_logic
  );
end entity;
```

### Componentes

Pasamos a declarar todos los componentes, vemos que existen varios componentes repetidos que solo varían en la cantidad de bits que manejan o si disponen de algunas entradas, como en el caso de los registros que varían en tamaño o los flip flop que el de la salida serial tiene clear y enable mientras que el que genera el reset sincronico no, a pesar de esto no existe la necesidad de hacer un modulo aparte para cada uno, solo que cuando estos sean instanciados, se les pasaran argumentos para definir estas cosas, o se cortocircuitara entradas a masa o +V.

#### Flip Flops D 
En el código de abajo vemos como declaramos un flip flop con todas las entradas típicas del flip flop D, sin embargo cuando se realice el port map del flip flop **FD** su entrada de reset estará siempre en bajo mientras que su **clk_ena** estará siempre en alto.
```vhdl
--flip flops D
  component ffd is
    generic (risingEdgeClock : BOOLEAN := TRUE);
    port (
    clk_in : in std_logic ;
    rst_in : in std_logic ;
    clk_ena: in std_logic ;
    d_in   : in std_logic ;
    d_out  : out std_logic
    );
  end component ffd;
```
- [codigo completo](VHDL/ffd.vhd)
- [codigo del testbench](VHDL/ffd_tb.vhd)

#### Registros 

Abajo figura el componente que utilizaremos para generar los registros paralelo-paralelo que ya hemos mencionado, podemos ver que en **generic** están los parámetros  que podemos modificar, en este caso son, el tipo de activación, setteado por defecto a activo por flanco de subida, y la cantidad de bits, setteada por defecto a 2, por supuesto esta ultima sera la que cambiaremos para generar los distintos registros. 


```vhdl
  --registros PIPO
  component register_PIPO is
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
  end component register_PIPO;
```
- [codigo completo](VHDL/register_PIPO.vhd)
- [codigo del testbench](VHDL/register_PIPO_tb.vhd)

#### Multiplexores, Join, Split y compuertas logicas. 

Debido a la simplicidad del modelo combinacional del multiplexor no generamos uncomponente extra, sino que luego en la arquitectura seran declarados como estructuras with-select, lo mismo ocurre para la compuerta NOR de generacion de la condicion de cero y los circuitos de union y separacion de tramas de bits.

### RAM 

Debajo vemos a la memoria RAM, nuevamente vemos parametros **generic** los cuales deben ser setteados a valores que para este caso son los predeterminados, pero si dejamos sin conectarlos nuestro codigo perderia portabilidad ya que el proceso para redimensionar las longitudes de palabra o de direcciones de memoria involucraria al modulo de la RAM, como puertos posee a su clock (**clk_in**) y una habilitacion de escritura (**writeEn_in**) un bus para la entrada de direcciones (**address_in**) y otro para la entrada de datos (**data_in**), ambos serian necesarios de hipoteticamente querer escribir la RAM, ya que **address_in** nos diria donde y  **data_in** nos diria que. Por ultimo tenemos un bus de salida de datos(**data_out**), desde el cual sale la trama que contiene la instruccion para el procesador.

```vhdl
  --memoria RAM
  component RAM256x16
      generic (
          WORD_LENGTH : integer := 16;
          ADDR_LENGTH : integer := 8
      );
      port (
          clk_in     : in  std_logic;
          writeEn_in : in  std_logic;
          address_in : in  std_logic_vector(ADDR_LENGTH-1 downto 0);
          data_in    : in  std_logic_vector(WORD_LENGTH-1 downto 0);
          data_out   : out std_logic_vector(WORD_LENGTH-1 downto 0)
      );
  end component RAM256x16;
```

- [codigo completo](VHDL/RAM256x16.vhd)
- [codigo del testbench](VHDL/RAM256x16_tb.vhd)

### ALU

La unidad aritmético lógica ya descripta en secciones anteriores de la documentación.

```vhdl
  --ALU
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

```
- [codigo completo](VHDL/ALU.vhd)
- [codigo del testbench](VHDL/ALU_tb.vhd)

### Decoder

Nuevamente, un componente ya descripto, algo a destacar es el nombre con el que se denomina a la longitud de palabra con la que trabaja el decoder, **HALF_IR_LENGTH** va directamente relacionado al hecho de que la entrada del decoder son los 8 bits mas significativos del bus de 16 bits del **Instruction Register**.

```vhdl
  --decoder
  component decoder_toplevel is
    generic (HALF_IR_LENGTH : integer := 8 );
    port (
    clk_in   : in std_logic ;
    clockEnable_in : in std_logic ;
    clr_in     : in std_logic ;
    carry_in   : in std_logic ;
    zero_in    : in std_logic ;
    ir_in      : in std_logic_vector(HALF_IR_LENGTH-1 downto 0);
    ram_out    : out std_logic;
    alu_s0_out : out std_logic;
    alu_s1_out : out std_logic;
    alu_s2_out : out std_logic;
    alu_s3_out : out std_logic;
    alu_s4_out : out std_logic;
    mux_a_out  : out std_logic;
    mux_b_out  : out std_logic;
    mux_c_out  : out std_logic;
    ir_clockEnable_out : out std_logic;
    pc_clockEnable_out : out std_logic;
    da_clockEnable_out : out std_logic
    );
  end component decoder_toplevel;

```

- [codigo completo](VHDL/decoder_toplevel.vhd)
- [codigo del testbench](VHDL/decoder_toplevel_tb.vhd)



### Señales y Constantes

Declaramos las constantes que habiamos mencionado van a servir para generar componentes con las caracteristicas ajustadas a nuestro proyecto.

```vhdl
 --declaracion de constantes
  constant NUM_BITS   : integer := 8  ;
  constant ADDR_LEN   : integer := 8  ;
  constant RAM_WORD   : integer := 16 ;
  constant IR_REG_LEN : integer := 16 ;
```
- **NUM_BITS**: Longitud de todos las lineas de 8 bits.
- **ADDR_LEN**: Longitud de las direcciones de memoria de la RAM.
- **RAM_WORD**: Longitud de palabra de la RAM.
- **IR_REG_LEN**: Longitud del registro Instruction Register.

Y ahora declaramos las señales que nos seran necesarias para el mappeo de los componentes dentro del sistema. 

<details>
  <summary>
    <b> <mark>Hacer click aquí para ver el codigo de la declaracion de las señales del softcore 
    </b> </mark>
  </summary> 

```vhdl
  --declaracion de las señales internas al softcore segun el modelo Simple CPU V1
  signal clear_s    : std_logic ; -- clear de todo el sistema
  signal vcc_s      : std_logic ; -- ce del decoder
  signal cpu_di_s : std_logic_vector (RAM_WORD-1 downto 0); --la salida de la ram
  signal cpu_do_s : std_logic_vector (RAM_WORD-1 downto 0); --la entrada a la ram
  signal ram_we_s : std_logic ; -- habilitacion de escritura de la ram
  signal ram_ad_s : std_logic_vector (NUM_BITS-1 downto 0); --entrada de la direccion de la ram, en caso de estar WE en alto esta provee la direccion donde escribir y sino de donde sale el dato
  signal clock_s  : std_logic ; -- clock de todos los componentes secuenciales
  signal nclock_s : std_logic ; -- clock de la ram ya que esta va negado
  signal acc_out_s: std_logic_vector (NUM_BITS-1 downto 0); --la salida del acumulador
  signal en_da_s  : std_logic ; -- habilita el clock del acumulador
  signal alu_out_s: std_logic_vector (NUM_BITS-1 downto 0); --el resultado de la ALU
  signal zero_s   : std_logic ; -- condicion de zero generada desde el resultado de la ALU
  signal carry_s  : std_logic ; -- condicion de carry generada desde la ALU
  signal alu_a_s  : std_logic_vector (NUM_BITS-1 downto 0); --primer sumando de la ALU
  signal alu_b_s  : std_logic_vector (NUM_BITS-1 downto 0); --segundo sumando de la ALU

  --inicio lineas de control de la ALU
  signal alu_s0_s : std_logic ;
  signal alu_s1_s : std_logic ;
  signal alu_s2_s : std_logic ;
  signal alu_s3_s : std_logic ;
  signal alu_s4_s : std_logic ;
  --fin lineas de control de la ALU

  signal pc_out_s : std_logic_vector (NUM_BITS-1 downto 0); -- salida del Program Counter
  signal muxa_s   : std_logic ; -- linea selectora del mux que selecciona el primer sumando de la ALU
  signal cpu_di_low_s : std_logic_vector (NUM_BITS-1 downto 0); -- los 8 bits menos significativos de la salida de la RAM
  signal ir_out_high_s: std_logic_vector (NUM_BITS-1 downto 0); -- los 8 bits mas significativos que salen de la IR
  signal muxb_s   : std_logic ; -- linea selectora del mux que selecciona el segundo sumando de la ALU
  signal muxc_s   : std_logic ; -- linea selectora del mux que selecciona el valor de la entrada addres de la ram
  signal en_pc_s  : std_logic ; -- linea de habilitacion del clock del program counter
  signal en_ir_s  : std_logic ; -- linea de habilitacion del clock del instrution register
  signal ir_out_low_s :std_logic_vector (NUM_BITS-1 downto 0); -- los 8 bits menos significativos de la salida del Instruction register
  signal ir_out_s : std_logic_vector(RAM_WORD-1 downto 0); -- la tira completa de bits que salen del ir
  signal serial_in_s : std_logic ; -- entrada al flip flop de la salida serial
  signal serial_ce_s : std_logic ; -- clock enable del flip flop puesto para la salida serial
  signal nserial_out_s:std_logic ; -- salida sin negar del flip flop de la salida serial
  signal fd_in  : std_logic ; -- entrada del flip flop FD de generacion de clear
  signal ground : std_logic ; -- señal que vale '0'
  ```
  
</details>

La existencia de las señales **ground** y **vcc_s** estan supeditadas al hecho de que las necesitamos para representar los componentes que poseen algún puerto conectado de manera constante al cero lógico o al uno lógico, por ejemplo, el FD previamente mencionado, o como se puede ver en el esquema, la habilitación del clock del **decoder**.

**NOTA**: En los esquemas aparecen varias veces las compuertas lógicas buffer, utilizadas comúnmente para regenerar un bit, como amplificador de corriente o seguidor de tensión, generando entre otras cosas, una capacidad de para no cargar eléctricamente a otro circuito de donde puede venir la entrada, sin embargo esto no representa un problema dentro del diseño en FPGA, más allá de eso, su representación seria trivial ya que su salida es igual a la entrada, entonces, no las representamos en el código.

### Arquitectura 

La arquitectura del toplevel resultara bastante directa, debido a que nosotros disponemos de todos los módulos que figuran en el circuito, solo debemos interconectarlos, generar algunos esquemas de multiplexacion y algunas entradas como la de la salida serie que son circuitos netamente combinacionales.

Comenzaremos por los mappeos de cada componente, primero los registros: 

#### Mapeo Registros 

```vhdl
-- registros PC (16 bits) ACC e IR (8 bits)
  --program Counter
  program_counter : register_PIPO
                  generic map (N_BITS => NUM_BITS,
                               risingEdgeClock => TRUE)
                  port map (clk_in => clock_s,
                            clockEnable_in => en_pc_s,
                            rst_in => clear_s ,
                            d_in   => alu_out_s,
                            d_out  => pc_out_s
                            );
  --istruction register
  instruction_register : register_PIPO
                        generic map (N_BITS => IR_REG_LEN,
                                     risingEdgeClock => TRUE)
                        port map  (clk_in => clock_s,
                                   clockEnable_in => en_ir_s,
                                   rst_in => clear_s ,
                                   d_in   => cpu_di_s,
                                   d_out  => ir_out_s
                                   );
  --acumulador
  accumulator : register_PIPO
              generic map (N_BITS => NUM_BITS,
                           risingEdgeClock => TRUE)
              port map  (clk_in => clock_s,
                         clockEnable_in => en_da_s,
                         rst_in => clear_s  ,
                         d_in   => alu_out_s,
                         d_out  => acc_out_s
                         ); 
```
Vemos como desde el generic map, les decimos a todos los registros que sean activos por flanco de subida y les indicamos su cantidad de bits, que en el caso de el **acumulador** y el **program Counter** es **NUM_BITS** que es 8 pero en el **IR** es **IR_REG_LEN** que vale 16. 

#### Esquemas De multiplexacion, Joins, Splits y procesos combinacionales

En el codigo de abajo se presentan los procesos por el cual dividimos las tiras de bits que salen de la RAM para poder ser procesadas, la union para poder hacer el camino inverso, los multiplexores A, B, C y el sistema de deteccion de resultado nulo a la salida de la ALU.

```vhdl
  ------------------------------------------------------------------------------
  --division de las tiras de bit que salen del IR y de la ram
  ir_out_high_s <= ir_out_s (IR_REG_LEN-1     downto IR_REG_LEN/2);
  ir_out_low_s  <= ir_out_s ((IR_REG_LEN/2)-1 downto  0);
  cpu_di_low_s  <= cpu_di_s ((RAM_WORD/2)-1   downto  0);
  --union de la tira de bits que entra a la RAM
  cpu_do_s  <= x"00" & acc_out_s ;
  ------------------------------------------------------------------------------
  -- inicio de los esquemas de multiplexacion
  -- multipexor del primer sumando de la alu
  with muxa_s select
      alu_a_s <= acc_out_s when '0',
                 pc_out_s  when others ;
  -- multipexor del segundo sumando de la alu
  with muxb_s select
       alu_b_s <= cpu_di_low_s when '0',
                  ir_out_low_s when others ;
  -- multiplexor para la siguiente direccion de la RAM
  with muxc_s select
       ram_ad_s <= pc_out_s when '0',
                   ir_out_low_s when others ;
  ------------------------------------------------------------------------------
  --generacion de la condicion de cero en la salida de la ALU
  zero_s <= '1' when alu_out_s = "00000000" else '0';

```


#### Mapeo Memoria RAM, ALU y Decoder

<details>
  <summary>
    <b> <mark>Hacer click aquí para ver el codigo 
    </b> </mark>
  </summary> 

```vhdl 
  --memoria RAM
  RAM256x16_0 : RAM256x16
      generic map (
            WORD_LENGTH => RAM_WORD,
            ADDR_LENGTH => ADDR_LEN
      )
      port map (
            clk_in     => nclock_s,
            writeEn_in => ram_we_s,
            address_in => ram_ad_s,
            data_in    => cpu_do_s,
            data_out   => cpu_di_s
      );
  ------------------------------------------------------------------------------
  --decoder
  decoder_0 : decoder_toplevel
      generic map (HALF_IR_LENGTH => IR_REG_LEN/2)
      port map (clk_in  => clock_s        ,
                clockEnable_in => vcc_s   ,
                clr_in  => clear_s  ,
                carry_in=> carry_s  ,
                zero_in => zero_s   ,
                ir_in   => ir_out_high_s  ,
                ram_out => ram_we_s       ,
                alu_s0_out => alu_s0_s ,
                alu_s1_out => alu_s1_s ,
                alu_s2_out => alu_s2_s ,
                alu_s3_out => alu_s3_s ,
                alu_s4_out => alu_s4_s ,
                mux_a_out  => muxa_s ,
                mux_b_out  => muxb_s ,
                mux_c_out  => muxc_s ,
                ir_clockEnable_out =>en_ir_s,
                pc_clockEnable_out =>en_pc_s,
                da_clockEnable_out =>en_da_s);
  ------------------------------------------------------------------------------
  --ALU
  ALU_0 : ALU
      generic map (
          N_BITS => NUM_BITS
      )
      port map (
          a_in    => alu_a_s,
          b_in    => alu_b_s,
          s0_in   => alu_s0_s,
          s1_in   => alu_s1_s,
          s2_in   => alu_s2_s,
          s3_in   => alu_s3_s,
          s4_in   => alu_s4_s,
          z_out   => alu_out_s,
          Car_out => carry_s
      );
  ------------------------------------------------------------------------------
```


</details>

- [Codigo Completo](../../VHDL/softcore.vhd)
- [Codigo Completo del Testbench](VHDL/softcore_tb.vhd)

* [Volver atras](../../README.md)
