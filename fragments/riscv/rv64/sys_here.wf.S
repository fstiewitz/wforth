// native word .phere (here)
.phere:
    la a0, .hereptr
    addi sp, sp, -8
    sd a0, (sp)
    j .next
