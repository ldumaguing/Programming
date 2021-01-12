cmake_minimum_required(VERSION 3.0)

project(j0_create_j0 LANGUAGES C)

add_executable(j0_create_j0 main.c)

add_library(
   myne
   Myne/myne.h
   Myne/arguments.c
   Myne/secondaries.c
   )

target_link_libraries(j0_create_j0
   PRIVATE myne
   json-c
   )

install(TARGETS j0_create_j0 RUNTIME DESTINATION bin)
