cmake_minimum_required(VERSION 3.0)

project(graft_branch LANGUAGES C)

add_executable(graft_branch main.c)

add_library(
   myne
   Myne/myne.h
   Myne/graft_branch.c
   Myne/RegExpStuffs.c
   )
   
target_link_libraries(graft_branch
   PRIVATE myne
   json-c
   )

install(TARGETS graft_branch RUNTIME DESTINATION bin)
