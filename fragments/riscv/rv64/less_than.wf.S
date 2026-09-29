// native word .lt <
.lt:
    ld a1, (sp)
    ld a0, 8(sp)
    addi sp, sp, 8
    blt a0, a1, .rtrue
    j .rfalse
