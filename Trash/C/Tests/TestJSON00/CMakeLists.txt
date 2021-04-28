cmake_minimum_required(VERSION 3.0)

project(testjson00 LANGUAGES C)

add_executable(testjson00 main.c)

target_link_libraries(testjson00 json-c)

install(TARGETS testjson00 RUNTIME DESTINATION bin)
