// native word .mdivmod */mod
.mdivmod:
    ld a4, 16(sp)
    ld a5, 8(sp)
    ld a2, 0(sp)
    mulh a1, a4, a5
    mul  a0, a4, a5
    sd a1, 16(sp)
    sd a0, 8(sp)
    srai a3, a2, 63
    call __divti3
    ld a1, 16(sp)
    ld a2, 8(sp)
    sd a0, 8(sp)
    mv a0, a2
    ld a2, 0(sp)
    srai a3, a2, 63
    call __modti3
    sd a0, 16(sp)
    addi sp, sp, 8
    j .next
