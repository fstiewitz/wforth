// native word .rshift rshift
.rshift:
    ld a1, 8(sp)
    ld a0, (sp)
    srl a0, a1, a0
    sd a0, 8(sp)
    addi sp, sp, 8
    j .next
