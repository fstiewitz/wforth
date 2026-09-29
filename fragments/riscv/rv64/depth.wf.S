// native word .depth depth
.depth:
    sub a0, s7, sp
    srli a0, a0, 3
    addi sp, sp, -8
    sd a0, (sp)
    j .next
