cmake_minimum_required(VERSION 3.0)

project(deletetag LANGUAGES C)

add_executable(deletetag main.c)

install(TARGETS deletetag RUNTIME DESTINATION bin)
