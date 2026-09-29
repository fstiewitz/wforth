// native word .cstore c!
.cstore:
    ld a0, (sp)
    ld a1, 8(sp)
    sb a1, (a0)
    addi sp, sp, 16
    j .next
