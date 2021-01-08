cmake_minimum_required(VERSION 3.0)

project(pretty_json LANGUAGES C)

add_executable(pretty_json main.c)

target_link_libraries(pretty_json json-c)

install(TARGETS pretty_json RUNTIME DESTINATION bin)
