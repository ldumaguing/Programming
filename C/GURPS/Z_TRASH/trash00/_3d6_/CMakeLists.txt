cmake_minimum_required(VERSION 3.0)

project(_3d6_ LANGUAGES C)

add_executable(_3d6_ main.c)

install(TARGETS _3d6_ RUNTIME DESTINATION bin)
