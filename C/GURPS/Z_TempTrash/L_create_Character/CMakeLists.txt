cmake_minimum_required(VERSION 3.0)

project(L_create_Character LANGUAGES C)

add_executable(L_create_Character main.c)

add_library(
   myne
   Myne/myne.h
   Myne/arguments.c
   Myne/secondaries.c
   )

target_link_libraries(L_create_Character
   PRIVATE myne
   json-c
   )

install(TARGETS L_create_Character RUNTIME DESTINATION bin)
