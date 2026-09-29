// native word .refs (refs)
.refs:
    la a0, .refdata
    addi sp, sp, -8
    sd a0, (sp)
    j .next
