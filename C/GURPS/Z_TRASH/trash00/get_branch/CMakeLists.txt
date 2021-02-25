cmake_minimum_required(VERSION 3.0)

project(get_branch LANGUAGES C)

add_executable(get_branch main.c)

add_library(
   myne
   Myne/myne.h
   Myne/get_branch.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(get_branch
   PRIVATE myne
   json-c
   )

install(TARGETS get_branch RUNTIME DESTINATION bin)
