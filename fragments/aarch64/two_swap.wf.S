// native word .2swap 2swap
.2swap:
    ldr x0, [x20]
    ldr x1, [x20, #8]
    ldr x2, [x20, #16]
    ldr x3, [x20, #24]
    str x2, [x20]
    str x3, [x20, #8]
    str x0, [x20, #16]
    str x1, [x20, #24]
    b .next
