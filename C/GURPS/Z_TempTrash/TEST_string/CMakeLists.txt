cmake_minimum_required(VERSION 3.0)

project(TEST_string LANGUAGES C)

add_executable(TEST_string main.c)

install(TARGETS TEST_string RUNTIME DESTINATION bin)
