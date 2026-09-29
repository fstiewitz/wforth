// native word .variable (variable)
.variable:
    ld a0, (fp)
    addi a0, a0, 8
    sd a0, -8(sp)
    addi sp, sp, -8
    j .next
