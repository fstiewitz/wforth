// native word .ult u<
.ult:
    ld a1, (sp)
    ld a0, 8(sp)
    addi sp, sp, 8
    bltu a0, a1, .rtrue
    j .rfalse
