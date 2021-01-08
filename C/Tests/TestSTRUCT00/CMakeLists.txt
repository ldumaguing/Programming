cmake_minimum_required(VERSION 3.0)

project(teststruct00 LANGUAGES C)

add_executable(teststruct00 main.c)

install(TARGETS teststruct00 RUNTIME DESTINATION bin)
