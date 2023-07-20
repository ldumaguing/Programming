cmake_minimum_required(VERSION 3.22)

include(/pico/pico-sdk/external/pico_sdk_import.cmake)


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(PROJ_NAME fish)


project(${PROJ_NAME} C CXX ASM)


pico_sdk_init()

add_executable(${PROJ_NAME}
	main.cpp
)

target_link_libraries(${PROJ_NAME}
    pico_stdlib
    pico_multicore
)

# pico_enable_stdio_usb(${PROJ_NAME} 1)
# pico_enable_stdio_uart(${PROJ_NAME} 0)
pico_add_extra_outputs(${PROJ_NAME})

