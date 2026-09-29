// native word .cjmp (jmp)
.cjmp:
    add x22, x22, #8
.cjmp0:
    ldr x0, [x22]
    add x22, x22, x0
    b .next0
