// native word .quit (quit)
.quit:
    mov x20, x21
    adr x19, .return_stack
    adr x0, memory
    adr x1, .hereptr
    str x0, [x1]
.next:
    add x22, x22, #8
.next0:
    ldr x0, [x22]
    ldr x0, [x0]
    br x0
