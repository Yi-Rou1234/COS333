       IDENTIFICATION DIVISION.
       PROGRAM-ID. StatisticsProgram.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DataArray OCCURS 5 TIMES PIC S9(5).
       01 J PIC 9(3) VALUE 1.
       01 SmallestValue PIC 9(5).
       01 LargestValue PIC 9(5).
       01 ModeValue PIC 9(5).
       01 ModeCount PIC 9(5).
       01 CurrentCount PIC 9(5).
       01 I PIC 9(3) VALUE 1.
       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM READ-DATA
           PERFORM FIND-SMALLEST
           PERFORM FIND-LARGEST
           PERFORM FIND-MODE
           DISPLAY "Smallest value: " SmallestValue
           DISPLAY "Largest value: " LargestValue
           DISPLAY "Mode value: " ModeValue
           STOP RUN.
       READ-DATA.
           DISPLAY "Enter 5 integer values:"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               ACCEPT DataArray(I)
           END-PERFORM.
       FIND-SMALLEST.
           MOVE DataArray(1) TO SmallestValue
           PERFORM VARYING J FROM 2 BY 1 UNTIL J > 5
               IF DataArray(J) < SmallestValue
                   MOVE DataArray(J) TO SmallestValue
               END-IF
           END-PERFORM.
       FIND-LARGEST.
           MOVE DataArray(1) TO LargestValue
           PERFORM VARYING J FROM 2 BY 1 UNTIL J > 5
               IF DataArray(J) > LargestValue
                   MOVE DataArray(J) TO LargestValue
               END-IF
           END-PERFORM.
       FIND-MODE.
           MOVE 0 TO ModeCount
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               MOVE 1 TO CurrentCount
               COMPUTE J = I + 1
               PERFORM VARYING J FROM J BY 1 UNTIL J > 5
                   IF DataArray(I) = DataArray(J)
                       ADD 1 TO CurrentCount
                   END-IF
               END-PERFORM
               IF CurrentCount > ModeCount
                   MOVE CurrentCount TO ModeCount
                   MOVE DataArray(I) TO ModeValue
               END-IF
           END-PERFORM.
