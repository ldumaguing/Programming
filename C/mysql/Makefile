#INCLUDES=-I/usr/local/include/mysql -I/usr/local/include/mysql/mysql -L/usr/local/lib/mysql/ -lmariadb
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
	$(CC) list_Armors.c      -o list_Armors    $(INCLUDES)
	$(CC) list_Heroes.c      -o list_Heroes    $(INCLUDES)
	$(CC) roll_dice.c        -o roll_dice
	$(CC) roll_Attack.c      -o roll_Attack
	$(CC) scan_Hero.c        -o scan_Hero      $(INCLUDES)
	$(CC) set_Hero.c         -o set_Hero       $(INCLUDES)
	$(CC) wear_Armor.c       -o wear_Armor     $(INCLUDES)
	$(CC) calc_Jumping.c     -o calc_Jumping
	$(CC) roll_Contest.c     -o roll_Contest
	$(CC) calc_Dodge.c       -o calc_Dodge     -lm
	$(CC) calc_Throwing_Distance.c    -o calc_Throwing_Distance
	$(CC) calc_Throwing_Damage.c      -o calc_Throwing_Damage     -lm
	$(CC) calc_Throwing_RngDmg.c      -o calc_Throwing_RngDmg     -lm



current:
	$(CC) scan_Hero.c        -o scan_Hero      $(INCLUDES)


clean:
	rm calc_Throwing_RngDmg
	rm calc_Throwing_Damage
	rm calc_Throwing_Distance
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
	rm list_Armors
	rm list_Heroes
	rm roll_dice
	rm roll_Attack
	rm scan_Hero
	rm set_Hero
	rm wear_Armor



