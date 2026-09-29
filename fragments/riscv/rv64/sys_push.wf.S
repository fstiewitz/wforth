// native word .cpush (push)
.cpush:
    ld a0, 8(fp)
    sd a0, -8(sp)
    addi sp, sp, -8
    addi fp, fp, 8
    j .next
