cmake_minimum_required(VERSION 3.0)

project(hexagonCol LANGUAGES C)

add_executable(hexagonCol main.c)

add_library(
   myne
   Myne/myne.h
   Myne/hexagoncol.c
   Myne/sides.c
   Myne/utils.c
)

target_link_libraries(hexagonCol
   myne
   m
)

install(TARGETS hexagonCol RUNTIME DESTINATION bin)
