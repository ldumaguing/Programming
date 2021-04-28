CC=/usr/bin/cc
CFLAGS=-g -Wall

OBJS = depend1.o depend2.o
HEDS = depend1.h depend2.h

main1: $(OBJS) $(HEDS)
	$(CC) $(CFLAGS) $(OBJS) main1.c -o Hello

depend1.o: depend1.c
	$(CC) -c depend1.c

depend2.o: depend2.c
	$(CC) -c depend2.c

