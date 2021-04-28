cmake_minimum_required(VERSION 3.0)

project(hexagonRow LANGUAGES C)

add_executable(hexagonRow main.c)

add_library(
   myne
   Myne/myne.h
   Myne/hexagonrow.c
   Myne/sides.c
)

target_link_libraries(hexagonRow
   myne
   m
)

install(TARGETS hexagonRow RUNTIME DESTINATION bin)
