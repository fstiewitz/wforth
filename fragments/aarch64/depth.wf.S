// native word .depth depth
.depth:
    sub x0, x21, x20
    lsr x0, x0, #3
    str x0, [x20, #-8]!
    b .next
