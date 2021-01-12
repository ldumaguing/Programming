cmake_minimum_required(VERSION 3.0)

project(T_prettyJSON LANGUAGES C)

add_executable(T_prettyJSON main.c)

target_link_libraries(T_prettyJSON json-c)

install(TARGETS T_prettyJSON RUNTIME DESTINATION bin)
