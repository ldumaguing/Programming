cmake_minimum_required(VERSION 3.0)

project(roll_3d6 LANGUAGES C)

add_executable(roll_3d6 main.c)

install(TARGETS roll_3d6 RUNTIME DESTINATION bin)
