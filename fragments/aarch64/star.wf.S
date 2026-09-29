// native word .cmul *
.cmul:
    ldr x0, [x20], #8
    ldr x1, [x20]
    mul x0, x0, x1
    str x0, [x20]
    b .next
