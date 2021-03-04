cmake_minimum_required(VERSION 3.0)

project(fish03 LANGUAGES C)

add_executable(fish03 main.c)

install(TARGETS fish03 RUNTIME DESTINATION bin)
