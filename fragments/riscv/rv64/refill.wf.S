// native word .refill refill
.refill:
    la a0, sys_source_str
    addi a0, a0, 32
    sd a0, -8(a0)
    li a1, 256
    la a2, stdin
    ld a2, (a2)
    call fgets
    beqz a0, .pfalse
    la a0, sys_source_str
    addi a1, a0, 32
    li a3, 0
.rfstr:
    lb a4, 0(a1)
    beqz a4, .rfend
    addi a3, a3, 1
    addi a1, a1, 1
    j .rfstr
.rfend:
    la a0, sys_source_str
    sd a3, 8(a0)
    sd x0, 16(a0)
    j .ptrue
