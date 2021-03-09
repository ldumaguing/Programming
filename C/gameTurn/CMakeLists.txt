cmake_minimum_required(VERSION 3.0)

project(gameTurn LANGUAGES C)

add_executable(gameTurn main.c)

install(TARGETS gameTurn RUNTIME DESTINATION bin)
