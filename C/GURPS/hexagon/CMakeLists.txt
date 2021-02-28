cmake_minimum_required(VERSION 3.0)

project(hexagon LANGUAGES C)

add_executable(hexagon main.c)

add_library(
   myne
   Myne/myne.h
   Myne/hexagon.c
   Myne/sides.c
)

target_link_libraries(hexagon
   myne
   m
)

install(TARGETS hexagon RUNTIME DESTINATION bin)
