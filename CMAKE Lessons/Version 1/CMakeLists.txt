cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)


project(${PROJ_NAME} C CXX ASM)

add_library(lib1 STATIC myLibrary/foo.c)
target_include_directories(lib1 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/myLibrary/include)



add_executable(${PROJ_NAME}
	main.c
)

target_link_libraries(${PROJ_NAME} PUBLIC lib1)

