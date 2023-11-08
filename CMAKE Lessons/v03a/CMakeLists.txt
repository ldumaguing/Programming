# The minimum version of cmake.  Use command: cmake --version
cmake_minimum_required(VERSION 3.25)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)

project(${PROJ_NAME} VERSION 1.0)

add_subdirectory(components/Foo)
add_subdirectory(components/Bar)

add_executable(${PROJ_NAME} main.c)



# Seems this is the linking phase.  Put this last.
target_link_libraries(${PROJ_NAME} PUBLIC Foo Bar)


