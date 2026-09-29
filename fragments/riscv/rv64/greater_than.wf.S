// native word .gt >
.gt:
    ld a1, (sp)
    ld a0, 8(sp)
    addi sp, sp, 8
    bgt a0, a1, .rtrue
    j .rfalse
