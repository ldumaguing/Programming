cmake_minimum_required(VERSION 3.0)

project(Encryption)

add_executable(Encryption main.cpp)

install(TARGETS Encryption RUNTIME DESTINATION bin)
