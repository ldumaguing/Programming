cmake_minimum_required(VERSION 3.0)

project(TEST_array LANGUAGES C)

add_executable(TEST_array main.c)



install(TARGETS TEST_array RUNTIME DESTINATION bin)
