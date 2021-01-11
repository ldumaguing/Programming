cmake_minimum_required(VERSION 3.0)

project(d6_x LANGUAGES C)

add_executable(d6_x main.c)

install(TARGETS d6_x RUNTIME DESTINATION bin)
