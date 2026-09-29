// native word .dup dup
.dup:
    ldr x0, [x20]
    str x0, [x20, #-8]!
    b .next
