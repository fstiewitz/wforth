// native word .cbye bye
.cbye:
    ld a0, (sp)
    mv sp, s7
    addi sp, sp, 24
    ld ra, -8(sp)
    ld fp, -16(sp)
    ld s1, -24(sp)
    ret
