cmake_minimum_required(VERSION 3.0)

project(generateDamage LANGUAGES C)

add_executable(generateDamage main.c)

install(TARGETS generateDamage RUNTIME DESTINATION bin)
