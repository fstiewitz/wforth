// native word .cells cells
.cells:
    ld a0, (sp)
    slli a0, a0, 3
    sd a0, (sp)
    j .next
