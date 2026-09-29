// native word .r_fetch r@
.r_fetch:
    ldr x0, [x19, #-8]
    str x0, [x20, #-8]!
    b .next
