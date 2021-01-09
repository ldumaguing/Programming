cmake_minimum_required(VERSION 3.0)

project(create_Character LANGUAGES C)

add_executable(create_Character main.c)

add_library(
   myne
   Myne/myne.h
   Myne/Human.c
   Myne/arguments.c
   Myne/secondaries.c
   )

target_link_libraries(create_Character
   PRIVATE myne
   json-c
   )

install(TARGETS create_Character RUNTIME DESTINATION bin)
