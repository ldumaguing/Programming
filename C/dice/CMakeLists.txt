cmake_minimum_required(VERSION 3.0)

project(dice LANGUAGES C)

add_executable(dice main.c)

add_library(
   myne
   Myne/myne.h
   Myne/dice.c
   Myne/GURPS.c
)

target_link_libraries(dice
   myne
   m
)
install(TARGETS dice RUNTIME DESTINATION bin)
