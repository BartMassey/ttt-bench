       IDENTIFICATION DIVISION.
       PROGRAM-ID. TTT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY state.
       01 v PIC S9 COMP.
       01 n PIC 99.

       PROCEDURE DIVISION.
           ACCEPT n
           PERFORM n TIMES
               CALL "NegaMax" USING
                   BY REFERENCE state
                   BY REFERENCE v
           END-PERFORM
           DISPLAY v

           STOP RUN.
       END PROGRAM TTT.
