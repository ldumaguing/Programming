cmake_minimum_required(VERSION 3.0)

project(j2_clothe_j0 LANGUAGES C)

add_executable(j2_clothe_j0 main.c)

add_library(
   myne
   Myne/myne.h
   Myne/clothe.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(j2_clothe_j0
   PRIVATE myne
   json-c
   )

   install(TARGETS j2_clothe_j0 RUNTIME DESTINATION bin)
