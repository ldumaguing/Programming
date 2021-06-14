cmake_minimum_required(VERSION 3.0)

project(viewHuman LANGUAGES C)

add_executable(viewHuman main.c)


add_library(
   myne
   myne/myne.h
   myne/part1.c
)

# include_directories(/usr/include)
include_directories(/usr/local/include)

target_link_libraries(viewHuman
   myne
   m
   /usr/local/lib/libjson-c.a
#   /usr/lib/x86_64-linux-gnu/libjson-c.a
)


install(TARGETS viewHuman RUNTIME DESTINATION bin)
