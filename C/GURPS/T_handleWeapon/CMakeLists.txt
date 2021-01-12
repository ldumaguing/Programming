cmake_minimum_required(VERSION 3.0)

project(T_handleWeapon LANGUAGES C)

add_executable(T_handleWeapon main.c)

add_library(
   myne
   Myne/myne.h
   Myne/setWeapon.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(T_handleWeapon
   PRIVATE myne
   json-c
   )

install(TARGETS T_handleWeapon RUNTIME DESTINATION bin)
