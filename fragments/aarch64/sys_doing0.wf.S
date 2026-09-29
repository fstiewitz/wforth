// native word .doing0 (doing0)
.doing0:
    ldr x0, [x22]
    add x0, x0, #24
    str x0, [x20, #-8]!
    b .next
