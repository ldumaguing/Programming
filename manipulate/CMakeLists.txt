cmake_minimum_required(VERSION 3.0)

project(manipulate LANGUAGES C)

add_executable(manipulate main.c)



add_library(
   myne
   myne/myne.h
   myne/part1.c
   myne/utils1.c
   myne/Movement.c
)

# include_directories(/usr/include)
include_directories(/usr/local/include)

target_link_libraries(manipulate
   myne
   m
   /usr/local/lib/libjson-c.a
#   /usr/lib/x86_64-linux-gnu/libjson-c.a
)





install(TARGETS manipulate RUNTIME DESTINATION bin)
