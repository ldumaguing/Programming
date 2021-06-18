cmake_minimum_required(VERSION 3.0)

project(listtags LANGUAGES C)

add_executable(listtags main.c)

install(TARGETS listtags RUNTIME DESTINATION bin)
