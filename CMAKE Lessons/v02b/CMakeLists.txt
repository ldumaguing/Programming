# The minimum version of cmake.  Use command: cmake --version
cmake_minimum_required(VERSION 3.25)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)

project(${PROJ_NAME} VERSION 1.0)

add_library(Foo STATIC components/Foo/foo.c)
add_library(Bar STATIC components/Bar/bar.c)
target_include_directories(Foo PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/components/Foo/include
    ${CMAKE_CURRENT_SOURCE_DIR}/components/Bar/include
)

add_executable(${PROJ_NAME} main.c)



# Seems this is the linking phase.  Put this last.
target_link_libraries(${PROJ_NAME} PUBLIC Foo Bar)


