// native word .eq =
.eq:
    ld a1, (sp)
    ld a0, 8(sp)
    addi sp, sp, 8
    beq a0, a1, .rtrue
    j .rfalse
