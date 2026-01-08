       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADDNUM.
       AUTHOR. COBOL DEVELOPER.
       DATE-WRITTEN. 2026-01-08.
      *****************************************************************
      * PROGRAM: ADDNUM                                               *
      * PURPOSE: READ TWO NUMBERS FROM INPUT FILE, ADD THEM,          *
      *          AND WRITE THE SUM BACK TO THE SAME FILE              *
      *****************************************************************
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE
               ASSIGN TO "data/numbers.txt"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.
       
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE.
       01  INPUT-RECORD.
           05  IN-NUM1         PIC 9(5).
           05  FILLER          PIC X(1).
           05  IN-NUM2         PIC 9(5).
           05  FILLER          PIC X(1).
           05  IN-SUM          PIC 9(6).
       
       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS      PIC XX.
           88  WS-FILE-OK      VALUE "00".
           88  WS-FILE-EOF     VALUE "10".
       
       01  WS-CALC-SUM         PIC 9(6).
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-OPEN-FILE
           PERFORM 200-PROCESS-FILE
           PERFORM 300-CLOSE-FILE
           STOP RUN.
       
       100-OPEN-FILE.
           OPEN I-O INPUT-FILE
           IF NOT WS-FILE-OK
               DISPLAY "ERROR OPENING FILE. STATUS: " WS-FILE-STATUS
               STOP RUN
           END-IF.
       
       200-PROCESS-FILE.
           READ INPUT-FILE
               AT END
                   DISPLAY "ERROR: NO DATA IN FILE"
                   GO TO 200-EXIT
               NOT AT END
                   PERFORM 210-CALCULATE-SUM
                   PERFORM 220-REWRITE-RECORD
           END-READ.
       200-EXIT.
           EXIT.
       
       210-CALCULATE-SUM.
           COMPUTE WS-CALC-SUM = IN-NUM1 + IN-NUM2
           DISPLAY "NUM1: " IN-NUM1
           DISPLAY "NUM2: " IN-NUM2
           DISPLAY "SUM:  " WS-CALC-SUM.
       
       220-REWRITE-RECORD.
           MOVE WS-CALC-SUM TO IN-SUM
           REWRITE INPUT-RECORD
           IF NOT WS-FILE-OK
               DISPLAY "ERROR REWRITING RECORD. STATUS: "
                   WS-FILE-STATUS
           ELSE
               DISPLAY "RECORD UPDATED SUCCESSFULLY"
           END-IF.
       
       300-CLOSE-FILE.
           CLOSE INPUT-FILE
           IF NOT WS-FILE-OK
               DISPLAY "ERROR CLOSING FILE. STATUS: " WS-FILE-STATUS
           END-IF.
