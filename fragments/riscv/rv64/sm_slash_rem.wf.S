// native word .smrem sm/rem
.smrem:
    ld a2, (sp)
    ld a1, 8(sp)
    ld a0, 16(sp)
    srai a3, a2, 63
    call __modti3
    mv a4, a0
    ld a2, (sp)
    ld a1, 8(sp)
    ld a0, 16(sp)
    sd a4, 16(sp)
    srai a3, a2, 63
    call __divti3
    sd a0, 8(sp)
    addi sp, sp, 8
    j .next
