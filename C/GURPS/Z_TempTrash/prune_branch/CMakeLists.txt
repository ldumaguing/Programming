cmake_minimum_required(VERSION 3.0)

project(prune_branch LANGUAGES C)

add_executable(prune_branch main.c)

add_library(
   myne
   Myne/myne.h
   Myne/prune_branch.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(prune_branch
   PRIVATE myne
   json-c
   )

install(TARGETS prune_branch RUNTIME DESTINATION bin)
