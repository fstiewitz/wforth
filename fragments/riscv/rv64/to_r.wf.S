// native word .to_r >r
.to_r:
    ld a0, (sp)
    sd a0, (s1)
    addi s1, s1, 8
    addi sp, sp, 8
    j .next
