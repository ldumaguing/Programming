cmake_minimum_required(VERSION 3.0)

project(L_resolve_Damage LANGUAGES C)

add_executable(L_resolve_Damage main.c)

add_library(
   myne
   Myne/myne.h
   Myne/L_resolve_Damage.c
   
   Myne/UtilityStuffs.h
   Myne/UtilityStuffs.c
)

target_link_libraries(L_resolve_Damage
   PRIVATE myne
   json-c
   m
)

install(TARGETS L_resolve_Damage RUNTIME DESTINATION bin)
