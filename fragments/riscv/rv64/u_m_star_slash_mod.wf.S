// native word .ummdivmod um*/mod
.ummdivmod:
    li a1, 1
    ld a0, (sp)
    beq a0, a1, .ummdivmod_mulonly
    ld a0, 8(sp)
    beq a0, a1, .ummdivmod_divonly
    mv a0, fp
    call unimplemented
.ummdivmod_mulonly:
    ld a0, 24(sp)
    ld a1, 16(sp)
    ld a2, 8(sp)
    addi sp, sp, 8
    mul a3, a0, a2
    mulhu a4, a0, a2
    sd a3, 16(sp)
    mul a3, a1, a2
    add a3, a3, a4
    sd a3, 8(sp)
    sd x0, (sp)
    j .next
.ummdivmod_divonly:
    ld a0, 24(sp)
    ld a1, 16(sp)
    ld a2, (sp)
    mv a3, x0
    addi sp, sp, 8
    mv a4, sp
    call __udivmodti4
    sd a0, 16(sp)
    sd a1, 8(sp)
    j .next
