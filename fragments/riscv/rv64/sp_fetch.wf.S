// native word .sp_fetch sp@
.sp_fetch:
    addi sp, sp, -8
    sd sp, (sp)
    j .next
