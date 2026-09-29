// native word .mmul m*
.mmul:
    ld a0, (sp)
    ld a1, 8(sp)
    mulh a2, a0, a1
    mul a3, a0, a1
    sd a2, (sp)
    sd a3, 8(sp)
    j .next
