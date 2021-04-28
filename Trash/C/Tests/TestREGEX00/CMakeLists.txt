cmake_minimum_required(VERSION 3.0)

project(testregex00 LANGUAGES C)

add_executable(testregex00 main.c)

install(TARGETS testregex00 RUNTIME DESTINATION bin)
