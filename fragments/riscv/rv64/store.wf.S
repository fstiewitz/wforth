// native word .store !
.store:
    ld a0, (sp)
    ld a1, 8(sp)
    sd a1, (a0)
    addi sp, sp, 16
    j .next
