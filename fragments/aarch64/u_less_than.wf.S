// native word .ult u<
.ult:
    ldr x0, [x20], #8
    ldr x1, [x20]
    cmp x1, x0
    b.lo .rtrue
    b .rfalse
