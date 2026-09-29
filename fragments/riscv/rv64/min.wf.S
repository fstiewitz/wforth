// native word .min min
.min:
    ld a0, (sp)
    ld a1, 8(sp)
    blt a1, a0, .drop
    sd a0, 8(sp)
    j .drop
