cmake_minimum_required(VERSION 3.0)

project(test00 LANGUAGES C)

add_executable(test00 main.c)

install(TARGETS test00 RUNTIME DESTINATION bin)
