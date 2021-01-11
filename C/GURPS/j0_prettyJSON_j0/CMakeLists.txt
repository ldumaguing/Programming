cmake_minimum_required(VERSION 3.0)

project(j0_prettyJSON_j0 LANGUAGES C)

add_executable(j0_prettyJSON_j0 main.c)

target_link_libraries(j0_prettyJSON_j0 json-c)

install(TARGETS j0_prettyJSON_j0 RUNTIME DESTINATION bin)
