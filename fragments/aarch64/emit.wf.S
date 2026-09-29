// native word .emit emit
.emit:
    ldr x0, [x20], #8
    bl putchar
    b .next
