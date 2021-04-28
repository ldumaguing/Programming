cmake_minimum_required(VERSION 3.0)

project(calc_ExtremeScores LANGUAGES C)

add_executable(calc_ExtremeScores main.c)

install(TARGETS calc_ExtremeScores RUNTIME DESTINATION bin)
