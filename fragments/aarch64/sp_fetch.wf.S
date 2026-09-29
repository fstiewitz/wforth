// native word .sp_fetch sp@
.sp_fetch:
    add x20, x20, #-8
    str x20, [x20]
    b .next
