cmake_minimum_required(VERSION 3.13)

include(/pico/pico-sdk/external/pico_sdk_import.cmake)

project(blink C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(PICO_EXAMPLES_PATH ${PROJECT_SOURCE_DIR})

pico_sdk_init()

add_executable(blink
	blink.cpp
	)

target_link_libraries(blink pico_stdlib)
pico_enable_stdio_usb(blink 1)



pico_add_extra_outputs(blink)

