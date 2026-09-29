// native word .cpush (push)
.cpush:
    ldr x0, [x22, #8]!
    str x0, [x20, #-8]!
    b .next
