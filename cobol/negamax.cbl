       IDENTIFICATION DIVISION.
       PROGRAM-ID. NegaMax IS RECURSIVE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 v0 PIC S9 COMP.

       LOCAL-STORAGE SECTION.
       01 v PIC S9 COMP.
       01 r PIC 9 COMP.
       01 c PIC 9 COMP.

       LINKAGE SECTION.
       COPY state.
       01 result PIC S9 COMP.

       PROCEDURE DIVISION USING
         BY REFERENCE state
         BY REFERENCE result.

           CALL "GameValue" USING
             BY REFERENCE state
             BY REFERENCE v0
           IF v0 NOT EQUAL -2 THEN
               MOVE v0 TO result
               EXIT PROGRAM
           END-IF

           MOVE -1 TO v
           PERFORM VARYING r FROM 1 BY 1 UNTIL r > 3
               PERFORM VARYING c FROM 1 BY 1 UNTIL c > 3
                   IF b-elem(r, c) EQUAL 0 THEN
      *                Evaluate move with do-undo.
                       COMPUTE on-move EQUAL -on-move
                       MOVE on-move TO b-elem(r, c)
                       CALL "NegaMax" USING
                         BY REFERENCE state
                         BY REFERENCE v0
                       COMPUTE v0 EQUAL -v0
                       COMPUTE on-move EQUAL -on-move
                       MOVE 0 TO b-elem(r, c)

      *                Capture maximum.
                       IF v0 GREATER THAN v THEN
                           MOVE v0 TO v
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           MOVE v TO result
           EXIT PROGRAM.

       END PROGRAM NegaMax.
