// native word .mdivmod */mod
.mdivmod:
    ldr x4, [x20, #16]
    ldr x5, [x20, #8]
    ldr x2, [x20, #0]
    mul x0, x4, x5
    smulh x1, x4, x5
    str x1, [x20, #16]
    str x0, [x20, #8]
    asr x3, x2, #63
    bl __divti3
    ldr x1, [x20, #16]
    ldr x2, [x20, #8]
    str x0, [x20, #8]
    mov x0, x2
    ldr x2, [x20]
    asr x3, x2, #63
    bl __modti3
    str x0, [x20, #16]
    add x20, x20, #8
    b .next
