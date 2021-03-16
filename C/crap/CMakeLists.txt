cmake_minimum_required(VERSION 3.0)

project(crap LANGUAGES C)

add_executable(crap main.c)

install(TARGETS crap RUNTIME DESTINATION bin)
