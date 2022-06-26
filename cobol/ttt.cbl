       IDENTIFICATION DIVISION.
       PROGRAM-ID. TTT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 n PIC 99.
       01 state.
           05 on-move PIC S9 VALUE 1.
           05 board.
               10 b-row OCCURS 3 TIMES.
                   15 b-elem PIC S9 VALUE 0 OCCURS 3 TIMES.

       01 v PIC S9.

       PROCEDURE DIVISION.
          ACCEPT n
          PERFORM n TIMES
              CALL "NegaMax" USING BY REFERENCE state RETURNING v
          END-PERFORM
          DISPLAY v

          STOP RUN.
       END PROGRAM TTT.
