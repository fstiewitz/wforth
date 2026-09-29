// native word .rot rot
.rot:
    ldr x0, [x20]
    ldr x1, [x20, #8]
    ldr x2, [x20, #16]
    str x2, [x20]
    str x0, [x20, #8]
    str x1, [x20, #16]
    b .next
