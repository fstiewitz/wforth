// native word .swap swap
.swap:
    ld a1, (sp)
    ld a0, 8(sp)
    sd a0, (sp)
    sd a1, 8(sp)
    j .next
