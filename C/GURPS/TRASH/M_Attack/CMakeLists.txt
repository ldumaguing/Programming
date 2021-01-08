cmake_minimum_required(VERSION 3.0)

project(M_Attack LANGUAGES C)

add_executable(M_Attack main.c)

add_library(
   myne
   Myne/myne.h
   Myne/UtilityStuffs.h
   Myne/hexagon.h

   Myne/Attack.c
   Myne/get_Unit.c
   Myne/get_Weapon.c
   Myne/get_Skills.c
   Myne/mod_Weapon_Usage.c
   Myne/using_Both_Hands.c
   Myne/using_One_Hand.c
   Myne/UtilityStuffs.c
   Myne/mod_Skill.c
   Myne/mod_ST.c
   Myne/PunchKick.c
   Myne/do_Bash.c
   Myne/do_Shoot.c
   Myne/do_Strike.c
   Myne/mod_Distance.c
   Myne/hexagon.c
   )

target_link_libraries(M_Attack
   PRIVATE myne
   json-c
   m
   )

install(TARGETS M_Attack RUNTIME DESTINATION bin)
