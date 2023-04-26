cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(push_button C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(PICO_EXAMPLES_PATH ${PROJECT_SOURCE_DIR})

pico_sdk_init()

add_executable(push_button
	main.c
	)

target_link_libraries(push_button pico_stdlib)
pico_enable_stdio_usb(push_button 1)



pico_add_extra_outputs(push_button)

