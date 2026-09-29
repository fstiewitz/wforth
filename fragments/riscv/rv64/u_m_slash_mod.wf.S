// native word .ummod um/mod
.ummod:
    ld a2, (sp)
    ld a1, 8(sp)
    ld a0, 16(sp)
    mv a3, x0
    mv a4, sp
    call __udivmodti4
    ld a2, (sp)
    addi sp, sp, 8
    sd a0, (sp)
    sd a2, 8(sp)
    j .next
