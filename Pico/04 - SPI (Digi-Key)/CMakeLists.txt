cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(adxl343_spi C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(adxl343_spi
	main.c
)

target_link_libraries(adxl343_spi
    pico_stdlib
    hardware_spi
)

pico_enable_stdio_usb(adxl343_spi 1)
pico_enable_stdio_uart(adxl343_spi 0)

pico_add_extra_outputs(adxl343_spi)

