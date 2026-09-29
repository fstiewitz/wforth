// native word .cadd +
.cadd:
    ld a1, (sp)
    ld a0, 8(sp)
    addi sp, sp, 8
    add a0, a0, a1
    sd a0, (sp)
    j .next
