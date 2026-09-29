// native word .dup dup
.dup:
    ld a0, (sp)
    addi sp, sp, -8
    sd a0, (sp)
    j .next
