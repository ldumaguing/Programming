add_library(Foo STATIC foo.c)
target_include_directories(Foo PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

