// native word .store !
.store:
    ldr x0, [x20], #8
    ldr x1, [x20], #8
    str x1, [x0]
    b .next
