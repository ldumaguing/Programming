INCLUDES=-I/usr/include/mysql -I/usr/include/mysql/mysql -L/usr/lib64/ -lmariadb
all: *.c
	gcc calc_BL.c -o calc_BL -lm
	gcc calc_Encumbrance.c -o calc_Encumbrance           -lm
	gcc calc_Move.c        -o calc_Move                  -lm
	gcc calc_Speed.c       -o calc_Speed                 -lm
	gcc calc_Swing.c       -o calc_Swing                 -lm
	gcc calc_Thrust.c      -o calc_Thrust                -lm
	gcc cookiecut_Hero.c   -o cookiecut_Hero $(INCLUDES) -lm
	gcc list_Armor.c       -o list_Armor     $(INCLUDES)
	gcc list_Heroes.c      -o list_Heroes    $(INCLUDES)
	gcc roll_dice.c        -o roll_dice
	gcc scan_Hero.c        -o scan_Hero      $(INCLUDES)
	gcc set_Hero.c         -o set_Hero       $(INCLUDES)
	# gcc wear_Armor.c       -o wear_Armor     $(INCLUDES)

current: wear_Armor.c
	gcc wear_Armor.c       -o wear_Armor     $(INCLUDES)

clean:
	rm calc_BL
	rm calc_Encumbrance
	rm calc_Move
	rm calc_Speed
	rm calc_Swing
	rm calc_Thrust
	rm cookiecut_Hero
	rm list_Armor
	rm list_Heroes
	rm roll_dice
	rm scan_Hero
	rm set_Hero
	rm wear_Armor



