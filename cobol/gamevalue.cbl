       IDENTIFICATION DIVISION.
       PROGRAM-ID. GameValue.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 v PIC S9 COMP.
       01 side PIC S9 COMP.
       01 n PIC 9 COMP.
       01 d PIC 9 COMP.
       01 r PIC 9 COMP.
       01 c PIC 9 COMP.

       LINKAGE SECTION.
       COPY state.
       01 result PIC S9 COMP.

       PROCEDURE DIVISION USING
         BY REFERENCE state
         BY REFERENCE result.

      *    Scan for wins.
           MOVE -1 TO side
           PERFORM 2 TIMES

      *        Set up win value.
               COMPUTE side EQUAL -side
               MULTIPLY side BY on-move GIVING v

      *        Scan for major diagonal win.
               MOVE 0 TO n
               PERFORM VARYING d FROM 1 BY 1 UNTIL d > 3
                   MOVE d TO r
                   MOVE d TO c
                   PERFORM CheckSquare
               END-PERFORM
               PERFORM CheckWin

      *        Scan for minor diagonal win.
               MOVE 0 TO n
               PERFORM VARYING d FROM 1 BY 1 UNTIL d > 3
                   MOVE d TO r
                   SUBTRACT d FROM 2 GIVING c
                   PERFORM CheckSquare
               END-PERFORM
               PERFORM CheckWin

      *        Scan for row win.
               PERFORM VARYING r FROM 1 BY 1 UNTIL r > 3
                   MOVE 0 TO n
                   PERFORM VARYING c FROM 1 BY 1 UNTIL c > 3
                       PERFORM CheckSquare
                   END-PERFORM
                   PERFORM CheckWin
               END-PERFORM

      *        Scan for column win.
               PERFORM VARYING c FROM 1 BY 1 UNTIL c > 3
                   MOVE 0 TO n
                   PERFORM VARYING r FROM 1 BY 1 UNTIL r > 3
                       PERFORM CheckSquare
                   END-PERFORM
                   PERFORM CheckWin
               END-PERFORM

           END-PERFORM

      *    No win was found: scan for blank.
           PERFORM VARYING r FROM 1 BY 1 UNTIL r > 3
               PERFORM VARYING c FROM 1 BY 1 UNTIL c > 3
                   IF b-elem(r, c) EQUAL 0 THEN
                       MOVE -2 TO result
                       EXIT PROGRAM
                   END-IF
               END-PERFORM
           END-PERFORM

      *    Position is a draw.
           MOVE 0 TO result
           EXIT PROGRAM.

           CheckWin.
           IF n EQUAL 3 THEN
               MOVE v TO result
               EXIT PROGRAM
           END-IF.

           CheckSquare.
           IF b-elem(r, c) EQUAL side THEN
               ADD 1 TO n
           END-IF.
       END PROGRAM GameValue.
