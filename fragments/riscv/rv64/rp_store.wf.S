// native word .rp_store rp!
.rp_store:
    ld s1, (sp)
    addi sp, sp, 8
    j .next
