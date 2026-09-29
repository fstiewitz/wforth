// native word .r_from r>
.r_from:
    addi s1, s1, -8
    ld a0, (s1)
    addi sp, sp, -8
    sd a0, (sp)
    j .next
