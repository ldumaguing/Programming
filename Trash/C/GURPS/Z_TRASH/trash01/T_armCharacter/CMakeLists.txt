cmake_minimum_required(VERSION 3.0)

project(T_armCharacter LANGUAGES C)

add_executable(T_armCharacter main.c)

add_library(
   myne
   Myne/myne.h
   Myne/armCharacter.c
   Myne/RegExpStuffs.c
)
   
target_link_libraries(T_armCharacter
   myne
   json-c
)

install(TARGETS T_armCharacter RUNTIME DESTINATION bin)
