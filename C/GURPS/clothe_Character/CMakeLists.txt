cmake_minimum_required(VERSION 3.0)

project(clothe_Character LANGUAGES C)

add_executable(clothe_Character main.c)

install(TARGETS clothe_Character RUNTIME DESTINATION bin)
