cmake_minimum_required(VERSION 3.0)

project(T_createCharacter LANGUAGES C)

add_executable(T_createCharacter
   main.c
   )

add_library(
   myne STATIC
   Myne/myne.h
   Myne/Human.c
   Myne/arguments.c
   Myne/secondaries.c
   )

include_directories(/usr/local/include)
   
target_link_libraries(T_createCharacter
   myne
   /usr/local/lib/libjson-c.a
   )
   
install(TARGETS T_createCharacter RUNTIME DESTINATION bin)
