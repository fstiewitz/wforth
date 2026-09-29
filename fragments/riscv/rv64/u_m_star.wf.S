// native word .umul um*
.umul:
    ld a0, (sp)
    ld a1, 8(sp)
    mulhu a2, a0, a1
    mul a3, a0, a1
    sd a2, (sp)
    sd a3, 8(sp)
    j .next
