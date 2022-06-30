       01 state.
           05 on-move PIC S9 VALUE 1 COMP.
           05 board.
               10 b-row OCCURS 3 TIMES.
                   15 b-elem PIC S9 COMP VALUE 0 OCCURS 3 TIMES.
