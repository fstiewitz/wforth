// native word .smrem sm/rem
.smrem:
    ldr x2, [x20]
    ldr x1, [x20, #8]
    ldr x0, [x20, #16]
    asr x3, x2, #63
    bl __modti3
    mov x4, x0
    ldr x2, [x20]
    ldr x1, [x20, #8]
    ldr x0, [x20, #16]
    str x4, [x20, #16]
    asr x3, x2, #63
    bl __divti3
    str x0, [x20, #8]!
    b .next
