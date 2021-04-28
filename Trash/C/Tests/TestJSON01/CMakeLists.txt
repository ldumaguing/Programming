cmake_minimum_required(VERSION 3.0)

project(testjson01 LANGUAGES C)

add_executable(testjson01 main.c)

target_link_libraries(testjson01 json-c)

install(TARGETS testjson01 RUNTIME DESTINATION bin)
