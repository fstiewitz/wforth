// native word .variable (variable)
.variable:
    ldr x0, [x22]
    add x0, x0, #8
    str x0, [x20, #-8]!
    b .next
