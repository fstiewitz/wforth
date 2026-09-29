// native word .max max
.max:
    ldr x0, [x20], #8
    ldr x1, [x20]
    cmp x0, x1
    b.gt .rx0
    b .next
