cmake_minimum_required(VERSION 3.0)

project(T_clotheCharacter LANGUAGES C)

add_executable(T_clotheCharacter main.c)

add_library(
   myne
   Myne/myne.h
   Myne/clothe.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(T_clotheCharacter
   myne
   json-c
   )

install(TARGETS T_clotheCharacter RUNTIME DESTINATION bin)
