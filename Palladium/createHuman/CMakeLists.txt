cmake_minimum_required(VERSION 3.0)

project(createHuman LANGUAGES C)

add_executable(createHuman main.c)

install(TARGETS createHuman RUNTIME DESTINATION bin)
