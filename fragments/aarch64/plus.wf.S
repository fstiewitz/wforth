// native word .cadd +
.cadd:
    ldr x0, [x20], #8
    ldr x1, [x20]
    add x1, x1, x0
    str x1, [x20]
    b .next
