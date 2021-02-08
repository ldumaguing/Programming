cmake_minimum_required(VERSION 3.0)

project(L_generate_Damage LANGUAGES C)

add_executable(L_generate_Damage main.c)

add_library(
   myne
   Myne/myne.h
   Myne/Dice.c
   Myne/L_generate_Damage.c
   
   Myne/UtilityStuffs.h
   Myne/UtilityStuffs.c
)

target_link_libraries(L_generate_Damage
   PRIVATE myne
   json-c
   m
)

install(TARGETS L_generate_Damage RUNTIME DESTINATION bin)
