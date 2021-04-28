cmake_minimum_required(VERSION 3.0)

project(j1_arm_j0 LANGUAGES C)

add_executable(j1_arm_j0 main.c)

add_library(
   myne
   Myne/myne.h
   Myne/arm.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(j1_arm_j0
   PRIVATE myne
   json-c
   )

install(TARGETS j1_arm_j0 RUNTIME DESTINATION bin)
