cmake_minimum_required(VERSION 3.22)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)


project(${PROJ_NAME} C CXX ASM)


add_executable(${PROJ_NAME}
	main.c
)



add_library(lib1
	myLibrary/foo/foo.c
)
add_library(lib2
	myLibrary/bar/bar.c
)

target_include_directories(lib1 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/myLibrary/foo)
target_include_directories(lib2 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/myLibrary/bar)




target_link_libraries(${PROJ_NAME} PUBLIC lib1 lib2)











