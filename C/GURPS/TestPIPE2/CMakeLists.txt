cmake_minimum_required(VERSION 3.0)

project(testpipe2 LANGUAGES C)

add_executable(testpipe2 main.c)

install(TARGETS testpipe2 RUNTIME DESTINATION bin)
