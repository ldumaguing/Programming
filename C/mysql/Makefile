# INCLUDES=-I/usr/local/include/mysql -I/usr/local/include/mysql/mysql -L/usr/local/lib/mysql/ -lmariadb
INCLUDES=-I/usr/include/mysql -I/usr/include/mysql/mysql -L/usr/lib64/ -lmariadb
CC=cc

all: *.c
	$(CC) calc_BasicLift.c   -o calc_BasicLift             -lm
	$(CC) calc_BMI.c         -o calc_BMI                   -lm
	$(CC) calc_Encumbrance.c -o calc_Encumbrance           -lm
	$(CC) calc_BasicMove.c   -o calc_BasicMove             -lm
	$(CC) calc_BasicSpeed.c  -o calc_BasicSpeed            -lm
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
	$(CC) calc_Jumping.c     -o calc_Jumping
	$(CC) roll_Contest.c     -o roll_Contest
	$(CC) calc_Dodge.c       -o calc_Dodge     -lm


current: wear_Armor.c
	$(CC) calc_BasicMove.c       -o calc_BasicMove     -lm

clean:
	rm calc_Dodge
	rm roll_Contest
	rm calc_Jumping
	rm calc_BasicLift
	rm calc_BMI
	rm calc_Encumbrance
	rm calc_BasicMove
	rm calc_BasicSpeed
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



