COBC = cobc
# COBFLAGS = -Wall -debug
COBFLAGS = -Wall -O3

OBJS = ttt.o negamax.o gamevalue.o 

.SUFFIXES: .cbl

.cbl.o:
	$(COBC) $(COBFLAGS) -c $*.cbl

ttt: $(OBJS) Makefile
	$(COBC) $(COBFLAGS) -x -o ttt $(OBJS)

ttt.o: ttt.cbl
	$(COBC) $(COBFLAGS) -x -c ttt.cbl

clean:
	-rm -f *.o ttt
