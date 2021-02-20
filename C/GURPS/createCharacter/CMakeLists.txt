cmake_minimum_required(VERSION 3.0)

project(createCharacter LANGUAGES C)

add_executable(createCharacter main.c)

install(TARGETS createCharacter RUNTIME DESTINATION bin)
