cmake_minimum_required(VERSION 3.0)

project(L_insert_into LANGUAGES C)

add_executable(L_insert_into main.c)

add_library(
   myne
   Myne/myne.h
   Myne/insert_into.c
   Myne/RegExpStuffs.c
   )

target_link_libraries(L_insert_into
    PRIVATE myne
    json-c
    )

install(TARGETS L_insert_into RUNTIME DESTINATION bin)
