// native word .cbr (br)
.cbr:
    ldr x0, [x20], #8
    add x22, x22, #8
    cbnz x0, .next
    b .cjmp0
