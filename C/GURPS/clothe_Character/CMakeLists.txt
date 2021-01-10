cmake_minimum_required(VERSION 3.0)

project(clothe_Character LANGUAGES C)

add_executable(clothe_Character main.c)

add_library(
   myne
   Myne/myne.h
   Myne/clothe.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(clothe_Character
   myne
   json-c
   )

install(TARGETS clothe_Character RUNTIME DESTINATION bin)
