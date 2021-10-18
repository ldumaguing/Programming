cmake_minimum_required(VERSION 3.0)

project(Arrows LANGUAGES C)

add_executable(Arrows main.c)



target_link_libraries(Arrows
   m
)




install(TARGETS Arrows RUNTIME DESTINATION bin)
