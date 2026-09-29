// native word .rp_fetch rp@
.rp_fetch:
    str x19, [x20, #-8]!
    b .next
