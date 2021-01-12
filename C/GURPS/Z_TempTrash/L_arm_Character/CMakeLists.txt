cmake_minimum_required(VERSION 3.0)

project(L_arm_character LANGUAGES C)

add_executable(L_arm_Character main.c)

add_library(
   myne
   Myne/myne.h
   Myne/arm.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(L_arm_Character
   PRIVATE myne
   json-c
   )

install(TARGETS L_arm_Character RUNTIME DESTINATION bin)
