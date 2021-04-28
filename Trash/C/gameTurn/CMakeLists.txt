cmake_minimum_required(VERSION 3.0)

project(gameTurn LANGUAGES C)

add_executable(gameTurn main.c)

add_library(
   myne
   Myne/myne.h
   Myne/gameturn.c
)

target_link_libraries(gameTurn
   myne
   m
)

install(TARGETS gameTurn RUNTIME DESTINATION bin)
