cmake_minimum_required(VERSION 3.0)

project(testpipe1a LANGUAGES C)

add_executable(testpipe1a main.c)

install(TARGETS testpipe1a RUNTIME DESTINATION bin)
