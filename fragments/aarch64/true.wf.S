// native word .ptrue true
.ptrue:
    add x20, x20, #-8
.rtrue:
    movn x0, #0
    str x0, [x20]
    b .next
