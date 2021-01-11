cmake_minimum_required(VERSION 3.0)

project(TEST_round LANGUAGES C)

add_executable(TEST_round main.c)

install(TARGETS TEST_round RUNTIME DESTINATION bin)
