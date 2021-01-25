cmake_minimum_required(VERSION 3.0)

project(T_createCharacter LANGUAGES C)

add_executable(T_createCharacter main.c)

add_library(
   myne
   Myne/myne.h
   Myne/Human.c
   Myne/arguments.c
   Myne/secondaries.c
   )

target_link_libraries(T_createCharacter
   PRIVATE myne
   json-c
   )

install(TARGETS T_createCharacter RUNTIME DESTINATION bin)
