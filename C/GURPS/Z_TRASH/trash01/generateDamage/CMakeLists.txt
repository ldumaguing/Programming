cmake_minimum_required(VERSION 3.0)

project(generateDamage LANGUAGES C)

add_executable(generateDamage main.c)

add_library(
   myne
   Myne/myne.h
   Myne/generateDMG.c
   Myne/options.c
)

target_link_libraries(generateDamage
   myne
   m
)

install(TARGETS generateDamage RUNTIME DESTINATION bin)
