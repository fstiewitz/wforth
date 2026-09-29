// native word .max max
.max:
    ld a0, (sp)
    ld a1, 8(sp)
    blt a0, a1, .drop
    sd a0, 8(sp)
    j .drop
