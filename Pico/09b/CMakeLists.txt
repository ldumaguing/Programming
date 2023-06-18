cmake_minimum_required(VERSION 3.12)

include(/pico/pico-sdk/external/pico_sdk_import.cmake)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)

project(${PROJ_NAME} C CXX ASM)

pico_sdk_init()




add_library(ili9341
	ili9341.c
)
target_link_libraries(ili9341
	pico_stdlib hardware_spi)
target_include_directories(ili9341 PUBLIC include)




add_library(mode0
	mode0.c
)
target_link_libraries(mode0
	ili9341 pico_stdlib hardware_spi)
target_include_directories(mode0 PUBLIC include)




add_executable(${PROJ_NAME}
    mode0_demo.c
)

pico_enable_stdio_usb(${PROJ_NAME} 1)
pico_add_extra_outputs(${PROJ_NAME})

target_link_libraries(${PROJ_NAME}
	mode0 pico_stdlib pico_mem_ops hardware_spi)



