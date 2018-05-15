# Copyright © 2012 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

CC = none
# CC = gcc -O4
# CC = clang -O3
#LONGTIME = -DLONGTIME=1000


CFLAGS = $(LONGTIME) -flto -std=gnu99 -march=native -Wall

OBJS = ttt.o negamax.o gamevalue.o

ttt: $(OBJS)
	$(CC) $(CFLAGS) -o ttt $(OBJS)

clean:
	-rm -f $(OBJS) ttt ttt-clang ttt-gcc
