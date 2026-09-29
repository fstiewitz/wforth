// native word .fetch @
.fetch:
    ldr x0, [x20]
    ldr x0, [x0]
    str x0, [x20]
    b .next
