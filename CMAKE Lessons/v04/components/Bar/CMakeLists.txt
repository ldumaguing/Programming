add_library(Bar STATIC bar.c)
target_include_directories(Bar PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
