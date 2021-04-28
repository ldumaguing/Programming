CC=/usr/bin/cc
CFLAGS=-g -Wall
RM=/bin/rm -f

OBJS = depend1.o depend2.o

main1: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) Hello.c -o Hello

depend1.o: depend1.c
	$(CC) -c depend1.c

depend2.o: depend2.c
	$(CC) -c depend2.c

clean:
	$(RM) *.o Hello
