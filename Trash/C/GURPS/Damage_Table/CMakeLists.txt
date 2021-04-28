cmake_minimum_required(VERSION 3.0)

project(Damage_Table LANGUAGES C)

add_executable(Damage_Table main.c)

add_library(
   myne
   Myne/myne.h
   Myne/damage_table.c
)

target_link_libraries(Damage_Table
   myne
   m
)

install(TARGETS Damage_Table RUNTIME DESTINATION bin)
