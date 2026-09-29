// native word .min min
.min:
    ldr x0, [x20], #8
    ldr x1, [x20]
    cmp x0, x1
    b.lt .rx0
    b .next
.rx0:
    str x0, [x20]
    b .next
