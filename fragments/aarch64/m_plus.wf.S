// native word .madd m+
.madd:
    ldr x2, [x20], #8
    ldr x1, [x20]
    ldr x0, [x20, #8]
    mov x3, #0
    adds x0, x0, x2
    adc x1, x1, x3
    str x1, [x20]
    str x0, [x20, #8]
    b .next
