// native word .phere (here)
.phere:
    adr x0, .hereptr
    str x0, [x20, #-8]!
    b .next
