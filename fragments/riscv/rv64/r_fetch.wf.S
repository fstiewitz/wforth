// native word .r_fetch r@
.r_fetch:
    ld a0, -8(s1)
    addi sp, sp, -8
    sd a0, (sp)
    j .next
