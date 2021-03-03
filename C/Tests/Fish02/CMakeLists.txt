cmake_minimum_required(VERSION 3.0)

project(fish02 LANGUAGES C)

add_executable(fish02 main.c)

install(TARGETS fish02 RUNTIME DESTINATION bin)
