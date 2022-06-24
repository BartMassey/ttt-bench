       IDENTIFICATION DIVISION.
       PROGRAM-ID. GameValue.

       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 v PIC S9.
       01 side PIC S9.
       01 n PIC 9.
       01 d PIC 9.
       01 od PIC 9.
       01 r PIC 9.
       01 c PIC 9.

       LINKAGE SECTION.
       01 state.
           05 on-move PIC S9.
           05 board.
               10 b-row OCCURS 3 TIMES.
                   15 b-elem PIC S9 OCCURS 3 TIMES.

       PROCEDURE DIVISION USING BY REFERENCE state.

      *    Scan for wins.
           MOVE -1 TO side
           PERFORM 2 TIMES

      *        Set up win value.
               COMPUTE side EQUALS -side
               MULTIPLY side BY on-move GIVING v

      *        Scan for major diagonal win.
               MOVE 0 TO n
               PERFORM TEST AFTER VARYING d FROM 1 BY 1 UNTIL d = 3
                   IF b-elem(d, d) EQUALS side THEN
                       ADD 1 TO n
                   END-IF
               END-PERFORM
               IF n EQUALS 3 THEN
                   MOVE v TO RETURN-CODE
                   GOBACK
               END-IF

      *        Scan for minor diagonal win.
               MOVE 0 TO n
               PERFORM TEST AFTER VARYING d FROM 1 BY 1 UNTIL d = 3
                   SUBTRACT d FROM 2 GIVING od
                   IF b-elem(d, od) EQUALS side THEN
                       ADD 1 TO n
                   END-IF
               END-PERFORM
               IF n EQUALS 3 THEN
                   MOVE v TO RETURN-CODE
                   GOBACK
               END-IF

      *        Scan for row win.
               PERFORM TEST AFTER VARYING r FROM 1 BY 1 UNTIL r = 3
                   MOVE 0 TO n
                   PERFORM TEST AFTER VARYING c FROM 1 BY 1 UNTIL c = 3
                       IF b-elem(r, c) EQUALS side THEN
                           ADD 1 TO n
                       END-IF
                   END-PERFORM
                   IF n EQUALS 3 THEN
                       MOVE v TO RETURN-CODE
                       GOBACK
                   END-IF
               END-PERFORM

      *        Scan for column win.
               PERFORM TEST AFTER VARYING c FROM 1 BY 1 UNTIL c = 3
                   MOVE 0 TO n
                   PERFORM TEST AFTER VARYING r FROM 1 BY 1 UNTIL r = 3
                       IF b-elem(r, c) EQUALS side THEN
                           ADD 1 TO n
                       END-IF
                   END-PERFORM
                   IF n EQUALS 3 THEN
                       MOVE v TO RETURN-CODE
                       GOBACK
                   END-IF
               END-PERFORM

           END-PERFORM

      *    No win was found: scan for blank.
           PERFORM TEST AFTER VARYING r FROM 1 BY 1 UNTIL r = 3
               PERFORM TEST AFTER VARYING c FROM 1 BY 1 UNTIL c = 3
                   IF b-elem(r, c) EQUALS 0 THEN
                       MOVE -2 TO RETURN-CODE
                       GOBACK
                   END-IF
               END-PERFORM
           END-PERFORM

      *    Position is a draw.
           MOVE 0 TO RETURN-CODE
           GOBACK.

       END PROGRAM GameValue.
