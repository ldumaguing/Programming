cmake_minimum_required(VERSION 3.0)

project(createHuman LANGUAGES C)

add_executable(createHuman main.c)

add_library(
   myne
   myne/myne.h
   myne/part1.c
)

include_directories(/usr/include)

target_link_libraries(createHuman
   myne
   m
   /usr/lib/x86_64-linux-gnu/libjson-c.a
)

install(TARGETS createHuman RUNTIME DESTINATION bin)
