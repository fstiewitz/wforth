// native word .cjmp (jmp)
.cjmp:
    addi fp, fp, 8
.cjmp0:
    ld a0, (fp)
    add fp, fp, a0
    j .next0
