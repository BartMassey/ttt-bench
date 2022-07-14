COBC = cobc
COBCWARN = -Wcall-params -Wcolumn-overflow -Wlinkage -Wunreachable
# COBFLAGS = $(COBCWARN) -debug
# Can use -std=cobol85 to check compatibility,
# except not for negamax.cbl which is recursive.
COBCFLAGS = $(COBCWARN) -O3 -finline-intrinsic -fstatic-call

OBJS = ttt.o negamax.o gamevalue.o 

.SUFFIXES: .cbl

.cbl.o:
	$(COBC) $(COBCFLAGS) -c $*.cbl

ttt: $(OBJS)
	$(COBC) $(COBCFLAGS) -x -o ttt $(OBJS)

ttt.o: ttt.cbl
	$(COBC) $(COBCFLAGS) -x -c ttt.cbl

$(OBJS): state.cpy Makefile

clean:
	-@rm -f *.o ttt
