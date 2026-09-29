// native word .mmul m*
.mmul:
    ldr x0, [x20]
    ldr x1, [x20, #8]
    mul x2, x0, x1
    smulh x3, x0, x1
    str x3, [x20]
    str x2, [x20, #8]
    b .next
