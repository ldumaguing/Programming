BasicUpstart2(start)
	* = $1000

start:
loop:
	inc $d021
	jmp loop
