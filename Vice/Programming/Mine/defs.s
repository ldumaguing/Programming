BANK_0 = $0
BANK_1 = $4000
BANK_2 = $8000
BANK_3 = $c000

BANK = BANK_2

BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
denom = BUFFER+2             ; location 4 and 5
multi = BUFFER+2             ; location 4 and 5

summy = BUFFER+4             ; location 6 and 7
count = BUFFER+4             ; location 6 and 7

LINE1 = 1024
LINE2 = 1064
LINE3 = 1104
LINE4 = 1144

x1 = BUFFER
y1 = BUFFER+1
x2 = BUFFER+2
y2 = BUFFER+3

flags = BUFFER+4
delta_X = BUFFER+5
delta_Y = BUFFER+6

SETLFS     = $ffba
SETNAM     = $ffbd
SAVE       = $ffd8
LOAD       = $ffd5
BORDER     = $d020
BACKGROUND = $d021
MESSAGE    = $9d

;SCREEN_MEM = $a000           ; $8000 + $2000
SCREEN_MEM = BANK+$2000
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


