cmake_minimum_required(VERSION 3.0)

project(testsdl01 LANGUAGES C)

add_executable(testsdl01 main.c)

target_link_libraries(testsdl01 SDL2)

install(TARGETS testsdl01 RUNTIME DESTINATION bin)
