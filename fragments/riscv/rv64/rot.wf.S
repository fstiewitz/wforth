// native word .rot rot
.rot:
    ld a2, (sp)
    ld a1, 8(sp)
    ld a0, 16(sp)
    sd a0, (sp)
    sd a2, 8(sp)
    sd a1, 16(sp)
    j .next
