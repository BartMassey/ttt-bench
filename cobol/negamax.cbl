       IDENTIFICATION DIVISION.
       PROGRAM-ID. NegaMax IS RECURSIVE.

       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 v0 PIC S9.
       01 v PIC S9.
       01 r PIC 9.
       01 c PIC 9.

       LINKAGE SECTION.
       01 state.
           05 on-move PIC S9.
           05 board.
               10 b-row OCCURS 3 TIMES.
                   15 b-elem PIC S9 OCCURS 3 TIMES.

       PROCEDURE DIVISION USING BY REFERENCE state.

           CALL "GameValue" USING BY REFERENCE state RETURNING v0
           IF v0 NOT EQUAL -2 THEN
               MOVE v0 TO RETURN-CODE
               GOBACK
           END-IF

           MOVE -1 TO v
           PERFORM TEST AFTER VARYING r FROM 1 BY 1 UNTIL r = 3
               PERFORM TEST AFTER VARYING c FROM 1 BY 1 UNTIL c = 3
                   IF b-elem(r, c) EQUALS 0 THEN
      *                Evaluate move with do-undo.
                       COMPUTE on-move EQUALS -on-move
                       MOVE on-move TO b-elem(r, c)
                       CALL "NegaMax" USING BY REFERENCE state
                         RETURNING v0
                       COMPUTE v0 EQUALS -v0
                       COMPUTE on-move EQUALS -on-move
                       MOVE 0 TO b-elem(r, c)

      *                Capture maximum.
                       IF v0 GREATER THAN v THEN
                           MOVE v0 TO v
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           MOVE v TO RETURN-CODE
           GOBACK.

       END PROGRAM NegaMax.
