// native word .doing0 (doing0)
.doing0:
    ld a0, (fp)
    addi a0, a0, 24
    sd a0, -8(sp)
    addi sp, sp, -8
    j .next
