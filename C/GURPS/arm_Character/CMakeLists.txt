cmake_minimum_required(VERSION 3.0)

project(arm_Character LANGUAGES C)

add_executable(arm_Character main.c)

add_library(
   myne
   Myne/myne.h
   Myne/arm.c
   Myne/RegExpStuffs.c
)
   
target_link_libraries(arm_Character
   myne
   json-c
)

install(TARGETS arm_Character RUNTIME DESTINATION bin)
