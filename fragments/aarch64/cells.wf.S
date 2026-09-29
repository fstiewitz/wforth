// native word .cells cells
.cells:
    ldr x0, [x20]
    lsl x0, x0, #3
    str x0, [x20]
    b .next
