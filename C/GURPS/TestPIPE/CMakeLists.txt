cmake_minimum_required(VERSION 3.0)

project(testpipe LANGUAGES C)

add_executable(testpipe main.c)

install(TARGETS testpipe RUNTIME DESTINATION bin)
