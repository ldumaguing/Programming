INCLUDES=-I/usr/local/include/mysql -I/usr/local/include/mysql/mysql -L/usr/local/lib/mysql/ -lmariadb
CC=cc

all: *.c
	$(CC) calc_BL.c -o calc_BL -lm
	$(CC) calc_BMI.c -o calc_BMI -lm
	$(CC) calc_Encumbrance.c -o calc_Encumbrance           -lm
	$(CC) calc_Move.c        -o calc_Move                  -lm
	$(CC) calc_Speed.c       -o calc_Speed                 -lm
	$(CC) calc_Swing.c       -o calc_Swing                 -lm
	$(CC) calc_Thrust.c      -o calc_Thrust                -lm
	$(CC) cookiecut_Hero.c   -o cookiecut_Hero $(INCLUDES) -lm
	$(CC) list_Armor.c       -o list_Armor     $(INCLUDES)
	$(CC) list_Heroes.c      -o list_Heroes    $(INCLUDES)
	$(CC) roll_dice.c        -o roll_dice
	$(CC) roll_Attack.c      -o roll_Attack
	$(CC) scan_Hero.c        -o scan_Hero      $(INCLUDES)
	$(CC) set_Hero.c         -o set_Hero       $(INCLUDES)
	$(CC) wear_Armor.c       -o wear_Armor     $(INCLUDES)
	$(CC) calc_Jumping.c       -o calc_Jumping
	$(CC) roll_Contest.c       -o roll_Contest


current: wear_Armor.c
	$(CC) roll_Contest.c       -o roll_Contest

clean:
	rm calc_Contest
	rm calc_Jumping
	rm calc_BL
	rm calc_BMI
	rm calc_Encumbrance
	rm calc_Move
	rm calc_Speed
	rm calc_Swing
	rm calc_Thrust
	rm cookiecut_Hero
	rm list_Armor
	rm list_Heroes
	rm roll_dice
	rm roll_Attack
	rm scan_Hero
	rm set_Hero
	rm wear_Armor



