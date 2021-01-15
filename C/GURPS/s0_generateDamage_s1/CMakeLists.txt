cmake_minimum_required(VERSION 3.0)

project(s0_generateDamage_s1 LANGUAGES C)

add_executable(s0_generateDamage_s1 main.c)

add_library(
   myne
   Myne/myne.h
   Myne/Dice.c
   Myne/generateDamage.c
   
   Myne/UtilityStuffs.h
   Myne/UtilityStuffs.c
)

target_link_libraries(s0_generateDamage_s1
   PRIVATE myne
   json-c
   m
)

install(TARGETS s0_generateDamage_s1 RUNTIME DESTINATION bin)
