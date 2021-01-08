cmake_minimum_required(VERSION 3.0)

project(L_insert_into_Tags LANGUAGES C)

add_executable(L_insert_into_Tags main.c)

add_library(
   myne
   Myne/myne.h
   Myne/insert_into_tags.c
   Myne/RegExpStuffs.c
   )

target_link_libraries(L_insert_into_Tags
    PRIVATE myne
    json-c
    )

install(TARGETS L_insert_into_Tags RUNTIME DESTINATION bin)
