// native word .r_from r>
.r_from:
    ldr x0, [x19, #-8]!
    str x0, [x20, #-8]!
    b .next
