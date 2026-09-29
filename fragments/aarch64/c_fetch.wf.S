// native word .cfetch c@
.cfetch:
    ldr x0, [x20]
    mov x1, #0
    ldrb w1, [x0]
    str x1, [x20]
    b .next
