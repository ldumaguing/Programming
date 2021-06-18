cmake_minimum_required(VERSION 3.0)

project(listTags LANGUAGES C)

add_executable(listTags main.c)

add_library(
   myne
   myne/myne.h
   myne/part1.c
   myne/utils1.c
)

# include_directories(/usr/include)
include_directories(/usr/local/include)

target_link_libraries(listTags
   myne
   m
   /usr/local/lib/libjson-c.a
#   /usr/lib/x86_64-linux-gnu/libjson-c.a
)

install(TARGETS listTags RUNTIME DESTINATION bin)
