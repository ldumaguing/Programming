cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(dualcore_hello C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(PICO_EXAMPLES_PATH ${PROJECT_SOURCE_DIR})

pico_sdk_init()

add_executable(dualcore_hello
	main.c
	)

target_link_libraries(dualcore_hello
    pico_stdlib
    pico_multicore
)

pico_enable_stdio_usb(dualcore_hello 1)

pico_add_extra_outputs(dualcore_hello)

