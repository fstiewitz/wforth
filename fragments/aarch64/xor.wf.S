// native word .cxor xor
.cxor:
    ldr x0, [x20], #8
    ldr x1, [x20]
    eor x1, x1, x0
    str x1, [x20]
    b .next
