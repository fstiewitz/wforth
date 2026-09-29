// native word .madd m+
.madd:
    ld a2, (sp)
    ld a1, 8(sp)
    ld a0, 16(sp)

    add a0, a0, a2
    sltu a3, a0, a2
    add a1, a1, a3

    sd a1, 8(sp)
    sd a0, 16(sp)
    addi sp, sp, 8
    j .next
