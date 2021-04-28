cmake_minimum_required(VERSION 3.0)

project(testjson02 LANGUAGES C)

add_executable(testjson02 main.c)

target_link_libraries(testjson02 json-c)

install(TARGETS testjson02 RUNTIME DESTINATION bin)
