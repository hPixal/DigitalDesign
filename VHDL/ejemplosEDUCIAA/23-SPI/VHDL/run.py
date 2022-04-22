# Importar librerias de VUnit
from vunit import VUnit

# Crear un contexto VUnit con los comandos pasados desde la Terminal
vu = VUnit.from_argv()

# Crear libreria de tests
lib = vu.add_library("lib")

# Agregar todos los archivos terminados en '.vhd' al espacio de trabajo de VUnit
# La herramienta reconoce como Testbenches aquellos que:
# 1. Empiezan con tb_*
# 2. Terminan con *_tb
lib.add_source_files("spi.vhd") # Codigo fuente del DUT
lib.add_source_files("test/*.vhd") # Directorio 'test/' con todos los testbenches y packages

# Ejecutar VUnit
vu.main()
