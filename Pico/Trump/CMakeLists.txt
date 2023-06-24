cmake_minimum_required(VERSION 3.22)

include(/pico/pico-sdk/external/pico_sdk_import.cmake)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJ_NAME fish)

project(${PROJ_NAME} C CXX ASM)

pico_sdk_init()

add_executable(${PROJ_NAME}
	graphicstest.cpp
)



# ******************************** The meat
add_library(TFTLCD
	stuffs/TFTLCD-Library/MAGA_TFTLCD.cpp
	stuffs/MAGA-GFX-Library/MAGA_GFX.cpp
)
# ####### add_library(GFX
# #######	stuffs/Adafruit-GFX-Library/Adafruit_GFX.cpp
# ####### )
# ####### add_library(Print
# #######     stuffs/arduino/Print.cpp
# ####### )

# ******************************** The bones.
target_include_directories(TFTLCD PUBLIC
	stuffs/TFTLCD-Library
	stuffs/MAGA-GFX-Library
)
# ####### target_include_directories(GFX PUBLIC
# #######    stuffs/Adafruit-GFX-Library
# #######    stuffs/arduino
# #######    stuffs/Adafruit_BusIO
# ####### )
# ####### target_include_directories(Print PUBLIC stuffs/arduino)




target_link_libraries(${PROJ_NAME}
	pico_stdlib
	TFTLCD
# #######	GFX
# #######	Print
)


pico_enable_stdio_usb(${PROJ_NAME} 1)
pico_add_extra_outputs(${PROJ_NAME})




 

# ####### sudo minicom -b 115200 -o -D /dev/ttyACM0 

  

