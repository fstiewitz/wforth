// native word .ummod um/mod
.ummod:
    ldr x2, [x20]
    ldr x1, [x20, #8]
    ldr x0, [x20, #16]
    mov x3, #0
    mov x4, x20
    bl __udivmodti4
    ldr x2, [x20], #8
    str x0, [x20]
    str x2, [x20, #8]
    b .next
