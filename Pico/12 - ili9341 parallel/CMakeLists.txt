cmake_minimum_required(VERSION 3.12)

include(/pico/pico-sdk/external/pico_sdk_import.cmake)


project(shawn_pico C CXX)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_subdirectory(ili9341)

