cmake_minimum_required(VERSION 3.0)

project(j0_setWeapon_j0 LANGUAGES C)

add_executable(j0_setWeapon_j0 main.c)

add_library(
   myne
   Myne/myne.h
   Myne/setWeapon.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(j0_setWeapon_j0
   PRIVATE myne
   json-c
   )

install(TARGETS j0_setWeapon_j0 RUNTIME DESTINATION bin)
