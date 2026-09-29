\ TO-FLOAT-TEST.FS
\
\ TEST FORTH-94 COMPLIANCE FOR >FLOAT
\
\ BY "ED" ON COMP.LANG.FORTH
\
\ REVISIONS:
\   2009-05-07  ED; CREATED
\   2009-05-08  KM; MODIFIED TO USE TTESTER.FS; THE TTESTER
\                   TESTS HAVE THE ADDED FEATURE THAT THEY
\                   VERIFY NOT ONLY THE FLAG RETURNED BY
\                   >FLOAT, BUT ALSO THE FLOATING POINT VALUE.
\   2010-04-25  KM; ADDITIONAL TESTS TO COVER SOME CASES NOT
\                   CHECKED EARLIER.

\ S" ANS-WORDS" INCLUDED

CR .( RUNNING TO-FLOAT-TEST.4TH)
CR .( -------------------------) CR

0 [IF]  \ ORIGINAL CODE

: CHK ( ADDR LEN FLAG )
  >R CR [CHAR] " EMIT 2DUP TYPE [CHAR] " EMIT
  8 OVER - SPACES  >FLOAT DUP >R IF FDROP THEN R>
  ." --> " DUP IF ." TRUE " ELSE ." FALSE" THEN
  R> - IF ."   *FAIL* " ELSE ."   PASS " THEN ;

: TEST ( -- )
  CR ." CHECKING >FLOAT FORTH-94 COMPLIANCE ..." CR
  S" ."    FALSE CHK
  S" E"    FALSE CHK
  S" .E"   FALSE CHK
  S" .E-"  FALSE CHK
  S" +"    FALSE CHK
  S" -"    FALSE CHK
  S"  9"   FALSE CHK
  S" 9 "   FALSE CHK
  S" "     TRUE CHK
  S"    "  TRUE CHK
  S" 1+1"  TRUE CHK
  S" 1-1"  TRUE CHK
  S" 9"    TRUE CHK
  S" 9."   TRUE CHK
  S" .9"   TRUE CHK
  S" 9E"   TRUE CHK
  S" 9E+"  TRUE CHK
  S" 9D-"  TRUE CHK
;

TEST

[ELSE]

\ S" TTESTER" INCLUDED

VARIABLE #ERRORS    0 #ERRORS !
: NONAME  ( C-ADDR U -- ) 1 #ERRORS +! ERROR1 ; ' NONAME ERROR-XT !
: ?.ERRORS  ( -- )  VERBOSE @ IF ." #ERRORS: " #ERRORS @ . THEN ;
: ?.CR  ( -- )  VERBOSE @ IF CR THEN ;
TRUE VERBOSE !

TESTING >FLOAT
DECIMAL
SET-EXACT
T{  S" ."    >FLOAT  ->   FALSE     }T
T{  S" E"    >FLOAT  ->   FALSE     }T
T{  S" .E"   >FLOAT  ->   FALSE     }T
T{  S" .E-"  >FLOAT  ->   FALSE     }T
T{  S" +"    >FLOAT  ->   FALSE     }T
T{  S" -"    >FLOAT  ->   FALSE     }T
T{  S"  9"   >FLOAT  ->   FALSE     }T    \ LEADING SPACE
T{  S" 9 "   >FLOAT  ->   FALSE     }T    \ TRAILING SPACE
T{  S" "     >FLOAT  ->   0E TRUE   RX}T
T{  S"    "  >FLOAT  ->   0E TRUE   RX}T
T{  S" 1+1"  >FLOAT  ->   10E TRUE  RX}T
T{  S" 1-1"  >FLOAT  ->   0.1E TRUE RX}T
T{  S" 9"    >FLOAT  ->   9E TRUE   RX}T
T{  S" 9."   >FLOAT  ->   9E TRUE   RX}T
T{  S" .9"   >FLOAT  ->   0.9E TRUE RX}T
T{  S" 9E"   >FLOAT  ->   9E TRUE   RX}T
T{  S" 9E+"  >FLOAT  ->   9E TRUE   RX}T
T{  S" 9D-"  >FLOAT  ->   9E TRUE   RX}T

\ ADDITIONAL TESTS
T{  S" -35E2"     >FLOAT  ->  -3500E TRUE  RX}T
T{  S" -35.E2"    >FLOAT  ->  -3500E TRUE  RX}T
T{  S" -35.0E2"   >FLOAT  ->  -3500E TRUE  RX}T
T{  S" -35.0E+2"  >FLOAT  ->  -3500E TRUE  RX}T
T{  S" -35.0E+02" >FLOAT  ->  -3500E TRUE  RX}T
T{  S" 35.E+2"    >FLOAT  ->   3500E TRUE  RX}T
T{  S" +35.E+2"   >FLOAT  ->   3500E TRUE  RX}T
T{  S" -35.+2"    >FLOAT  ->  -3500E TRUE  RX}T
T{  S" +35.+2"    >FLOAT  ->   3500E TRUE  RX}T
T{  S" -.35+4"    >FLOAT  ->  -3500E TRUE  RX}T
T{  S" +.35+4"    >FLOAT  ->   3500E TRUE  RX}T
T{  S" .35E4"     >FLOAT  ->   3500E TRUE  RX}T
T{  S" 0.35E4"    >FLOAT  ->   3500E TRUE  RX}T
T{  S" +0.35E4"   >FLOAT  ->   3500E TRUE  RX}T
T{  S" -0.35E4"   >FLOAT  ->  -3500E TRUE  RX}T
T{  S" -350000-2" >FLOAT  ->  -3500E TRUE  RX}T
T{  S" 350000E-2" >FLOAT  ->   3500E TRUE  RX}T

?.CR ?.ERRORS ?.CR
 
[THEN]

CR .( END OF TO-FLOAT-TEST.4TH) CR
