// native word .ummdivmod um*/mod
.ummdivmod:
    mov x1, #1
    ldr x0, [x20]
    cmp x0, x1
    b.eq .ummdivmod_mulonly
    ldr x0, [x20, #8]
    cmp x0, x1
    b.eq .ummdivmod_divonly
    mov x0, x22
    bl unimplemented
.ummdivmod_mulonly:
    ldr x0, [x20, #24]
    ldr x1, [x20, #16]
    ldr x2, [x20, #8]!
    mul x3, x0, x2
    umulh x4, x0, x2
    str x3, [x20, #16]
    mul x3, x1, x2
    add x3, x3, x4
    str x3, [x20, #8]
    mov x0, #0
    str x0, [x20]
    b .next
.ummdivmod_divonly:
    ldr x0, [x20, #24]
    ldr x1, [x20, #16]
    ldr x2, [x20]
    mov x3, #0
    add x20, x20, #8
    mov x4, x20
    bl __udivmodti4
    str x0, [x20, #16]
    str x1, [x20, #8]
    b .next
