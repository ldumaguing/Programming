BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
denom = BUFFER+4             ; location 4 and 5
multi = BUFFER+4             ; location 4 and 5

summy = BUFFER+6             ; location 6 and 7
count = BUFFER+6             ; location 6 and 7

LINE1 = 1024

SETLFS     = $ffba
SETNAM     = $ffbd
SAVE       = $ffd8
LOAD       = $ffd5
BORDER     = $d020
BACKGROUND = $d021
MESSAGE    = $9d

SCREEN_MEM = $a000           ; $8000 + $2000
MEM_TWO    = 2
BUFFER16   = 2024
TEXT_MEM   = 1024

VIC_BANK   = $dd00
MEM_SETUP  = $d018
COLOR_RAM  = $d800           ; 0000.0011

SCREEN_CONTROL_1 = $d011
SCREEN_CONTROL_2 = $d016

BLACK       = 0
WHITE       = 1
RED         = 2
CYAN        = 3
PURPLE      = 4
GREEN       = 5
BLUE        = 6
YELLOW      = 7
ORANGE      = 8
BROWN       = 9
PINK        = 10
DARK_GREY   = 11
GREY        = 12
LIGHT_GREEN = 13
LIGHT_BLUE  = 14
LIGHT_GREY  = 15


