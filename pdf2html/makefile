CC=gcc
CFLAGS=-O3 -Wall -funroll-loops
LDLIBS=-lpng
SRC_LIB= pbm2eps9.c printer.c
OBJ_LIB= ${SRC_LIB:.c=.o}

all: pbm2png pbm2eps9

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

.depend:
	$(CC) -MM $(OBJ_LIB) > $@

-include .depend

pbm2png: pbm2png.c
	$(CC) $(CFLAGS) -s -o $@ $< $(LDLIBS)

pbm2eps9: $(OBJ_LIB)
	$(CC) -s -o $@ $(OBJ_LIB)
clean:
	rm -f $(OBJ_LIB) pbm2png pbm2eps9

.PHONY: all clean



