cmake_minimum_required(VERSION 3.0)

project(testsdl02 LANGUAGES C)

add_executable(testsdl02 main.c)

target_link_libraries(testsdl02 SDL2)

install(TARGETS testsdl02 RUNTIME DESTINATION bin)
