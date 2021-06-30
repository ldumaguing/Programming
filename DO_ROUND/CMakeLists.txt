cmake_minimum_required(VERSION 3.0)

project(DO_ROUND LANGUAGES C)

add_executable(DO_ROUND main.c)


add_library(
   myne
   myne/myne.h
   myne/part1.c
)

# include_directories(/usr/include)
include_directories(/usr/local/include)

target_link_libraries(DO_ROUND
   myne
   m
   /usr/local/lib/libjson-c.a
#   /usr/lib/x86_64-linux-gnu/libjson-c.a
)



install(TARGETS DO_ROUND RUNTIME DESTINATION bin)
