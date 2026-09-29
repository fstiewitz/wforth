// native word .pfalse false
.pfalse:
    add x20, x20, #-8
.rfalse:
    mov x0, #0
    str x0, [x20]
    b .next
