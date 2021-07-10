cmake_minimum_required(VERSION 3.0)

project(myLS LANGUAGES C)

add_executable(myLS main.c)

install(TARGETS myLS RUNTIME DESTINATION bin)
