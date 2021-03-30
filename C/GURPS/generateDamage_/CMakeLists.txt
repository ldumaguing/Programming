cmake_minimum_required(VERSION 3.0)

project(generateDamage_ LANGUAGES C)

add_executable(generateDamage_ main.c)

add_library(
   myne
   Myne/myne.h
   Myne/generateDMG.c
)

target_link_libraries(generateDamage_
   myne
   m
)

install(TARGETS generateDamage_ RUNTIME DESTINATION bin)
