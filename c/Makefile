# Copyright © 2012 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

# XXX Specify a C compiler here. For benchmarking you need
# to say.
CC = none

# XXX The C compiler is presumed to take gcc-style flags.
CFLAGS = -O3 -flto -std=gnu99 -march=native -Wall

OBJS = ttt.o negamax.o gamevalue.o

ttt: $(OBJS)
	$(CC) $(CFLAGS) -o ttt $(OBJS)

clean:
	-rm -f $(OBJS) ttt
