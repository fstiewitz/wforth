// native word .gt >
.gt:
    ldr x0, [x20], #8
    ldr x1, [x20]
    cmp x1, x0
    b.gt .rtrue
    b .rfalse
