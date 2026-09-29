// native word .swap swap
.swap:
    ldr x0, [x20]
    ldr x1, [x20, #8]
    str x1, [x20]
    str x0, [x20, #8]
    b .next
