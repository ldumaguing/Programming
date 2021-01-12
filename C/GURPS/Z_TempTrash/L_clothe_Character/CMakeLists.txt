cmake_minimum_required(VERSION 3.0)

project(L_clothe_Character LANGUAGES C)

add_executable(L_clothe_Character main.c)

add_library(
   myne
   Myne/myne.h
   Myne/clothe.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(L_clothe_Character
   PRIVATE myne
   json-c
   )

   install(TARGETS L_clothe_Character RUNTIME DESTINATION bin)
