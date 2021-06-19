cmake_minimum_required(VERSION 3.0)

project(settag LANGUAGES C)

add_executable(settag main.c)

install(TARGETS settag RUNTIME DESTINATION bin)
