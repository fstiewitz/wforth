// native word .lshift lshift
.lshift:
    ldr x0, [x20], #8
    ldr x1, [x20]
    lsl x0, x1, x0
    str x0, [x20]
    b .next
