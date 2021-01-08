cmake_minimum_required(VERSION 3.0)

project(crap LANGUAGES C)

add_executable(crap main.c)

add_library(
   myne
   Myne/myne.h
   
   Myne/Dice.c
)

target_link_libraries(crap
   m
   )

install(TARGETS crap RUNTIME DESTINATION bin)
