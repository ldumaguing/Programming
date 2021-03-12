cmake_minimum_required(VERSION 3.0)

project(createcharacter LANGUAGES C)

add_executable(createcharacter main.c)

install(TARGETS createcharacter RUNTIME DESTINATION bin)
