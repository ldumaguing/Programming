cmake_minimum_required(VERSION 3.0)

project(testregex01 LANGUAGES C)

add_executable(testregex01 main.c)

install(TARGETS testregex01 RUNTIME DESTINATION bin)
