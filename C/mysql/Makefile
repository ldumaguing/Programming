INCLUDES=-I/usr/include/mariadb -I/usr/include/mariadb/mysql -L/usr/lib/x86_64-linux-gnu/ -lmariadb
all: *.c
	gcc calc_BL.c -o bin/calc_BL -lm
	gcc calc_Encumbrance.c -o bin/calc_Encumbrance           -lm
	gcc calc_Move.c        -o bin/calc_Move                  -lm
	gcc calc_Speed.c       -o bin/calc_Speed                 -lm
	gcc calc_Swing.c       -o bin/calc_Swing                 -lm
	gcc calc_Thrust.c      -o bin/calc_Thrust                -lm
	gcc cookiecut_Hero.c   -o bin/cookiecut_Hero $(INCLUDES) -lm
	gcc list_Armor.c       -o bin/list_Armor     $(INCLUDES)
	gcc list_Heroes.c      -o bin/list_Heroes    $(INCLUDES)
	gcc roll_dice.c        -o bin/roll_dice
	gcc scan_Hero.c        -o bin/scan_Hero      $(INCLUDES)
	gcc set_Hero.c         -o bin/set_Hero       $(INCLUDES)
	# gcc wear_Armor.c       -o bin/wear_Armor     $(INCLUDES)

now: wear_Armor.c
	gcc wear_Armor.c       -o bin/wear_Armor     $(INCLUDES)

clean:
	rm bin/*


