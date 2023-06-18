cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)


project(${PROJ_NAME} C CXX ASM)

add_library(lib1 STATIC
	lib/foo.cpp
	lib/Adafruit_ILI9341/Adafruit_ILI9341.cpp
#	lib/Adafruit-GFX-Library/Adafruit_GFX.cpp
	lib/Adafruit_BusIO/Adafruit_SPIDevice.cpp
#	lib/arduino/hardware/avr/1.8.6/libraries/SPI/src/SPI.cpp
	lib/hardware_spi/spi.c
)
target_include_directories(lib1 PUBLIC
	${CMAKE_CURRENT_SOURCE_DIR}/lib/include
	${CMAKE_CURRENT_SOURCE_DIR}/lib/Adafruit_ILI9341
#	${CMAKE_CURRENT_SOURCE_DIR}/lib/Adafruit-GFX-Library
#	${CMAKE_CURRENT_SOURCE_DIR}/lib/arduino/hardware/avr/1.8.6/cores/arduino
#	${CMAKE_CURRENT_SOURCE_DIR}/lib/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/avr/include
#	${CMAKE_CURRENT_SOURCE_DIR}/lib/arduino/hardware/avr/1.8.6/variants/standard
#	${CMAKE_CURRENT_SOURCE_DIR}/lib/Adafruit_BusIO
#	${CMAKE_CURRENT_SOURCE_DIR}/lib/arduino/hardware/avr/1.8.6/libraries/SPI/src
	${CMAKE_CURRENT_SOURCE_DIR}/lib/hardware_spi/include/hardware
)



add_executable(${PROJ_NAME}
	main.cpp
)

target_link_libraries(${PROJ_NAME} PUBLIC lib1)

