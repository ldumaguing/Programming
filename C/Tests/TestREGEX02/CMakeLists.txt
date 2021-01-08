cmake_minimum_required(VERSION 3.0)

project(testregex02 LANGUAGES C)

add_executable(testregex02 main.c)

install(TARGETS testregex02 RUNTIME DESTINATION bin)
