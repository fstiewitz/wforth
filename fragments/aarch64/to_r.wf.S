// native word .to_r >r
.to_r:
    ldr x0, [x20], #8
    str x0, [x19], #8
    b .next
