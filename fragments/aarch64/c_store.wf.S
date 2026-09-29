// native word .cstore c!
.cstore:
    ldr x0, [x20], #8
    ldr x1, [x20], #8
    strb w1, [x0]
    b .next
