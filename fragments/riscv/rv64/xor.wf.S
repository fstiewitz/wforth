// native word .cxor xor
.cxor:
    ld a1, (sp)
    ld a0, 8(sp)
    addi sp, sp, 8
    xor a0, a0, a1
    sd a0, (sp)
    j .next
