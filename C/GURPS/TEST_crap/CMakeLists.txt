cmake_minimum_required(VERSION 3.0)

project(TEST_crap LANGUAGES C)

add_executable(TEST_crap main.c)

install(TARGETS TEST_crap RUNTIME DESTINATION bin)
