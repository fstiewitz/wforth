// native word .2swap 2swap
.2swap:
    ld a3, (sp)
    ld a2, 8(sp)
    ld a1, 16(sp)
    ld a0, 24(sp)
    sd a1, (sp)
    sd a0, 8(sp)
    sd a3, 16(sp)
    sd a2, 24(sp)
    j .next
