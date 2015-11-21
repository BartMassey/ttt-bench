# Copyright © 2012 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

CFLAGS = -std=c99 -O2 -march=native -Wall

OBJS = ttt.o negamax.o gamevalue.o

ttt: $(OBJS)
	$(CC) $(CFLAGS) -o ttt $(OBJS)

clean:
	-rm -f $(OBJS) ttt
