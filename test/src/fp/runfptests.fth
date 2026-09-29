\ To run Floating Point tests

CR .( Running FP Tests) CR

\ 10E10 -2.5e2

\ : F 11E10 -3.5e2 SYS:EXIT ; F
\ expected representations:
\ 11e10: 42399C82CC000000
\ -3.5e2: C075E00000000000

S" [UNDEFINED]" PAD C! PAD CHAR+ PAD C@ MOVE
PAD FIND NIP 0=
[IF]
   : [UNDEFINED]  ( "name" -- flag )
      BL WORD FIND NIP 0=
   ; IMMEDIATE
[THEN]

S" ttester.fs"         INCLUDED
S" fatan2-test.fs"     INCLUDED
S" ieee-arith-test.fs" INCLUDED
S" ieee-fprox-test.fs" INCLUDED
S" fpzero-test.4th"    INCLUDED
S" fpio-test.4th"      INCLUDED
S" to-float-test.4th"  INCLUDED
S" paranoia.4th"       INCLUDED
S" ak-fp-test.fth"     INCLUDED

CR CR
.( FP tests finished) CR CR
