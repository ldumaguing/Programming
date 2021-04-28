cmake_minimum_required(VERSION 3.0)

project(L_set_Weapon LANGUAGES C)

add_executable(L_set_Weapon main.c)

add_library(
   myne
   Myne/myne.h
   Myne/setWeapon.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(L_set_Weapon
   PRIVATE myne
   json-c
   )

install(TARGETS L_set_Weapon RUNTIME DESTINATION bin)
