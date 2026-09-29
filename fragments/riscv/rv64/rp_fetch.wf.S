// native word .rp_fetch rp@
.rp_fetch:
    addi sp, sp, -8
    sd s1, (sp)
    j .next
