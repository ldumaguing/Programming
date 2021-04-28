cmake_minimum_required(VERSION 3.0)

project(testpipe1 LANGUAGES C)

add_executable(testpipe1 main.c)

install(TARGETS testpipe1 RUNTIME DESTINATION bin)
