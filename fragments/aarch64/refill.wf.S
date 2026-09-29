// native word .refill refill
.refill:
    adr x0, sys_source_str
    add x0, x0, #32
    str x0, [x0, #-8]
    mov x1, #256
    ldr x2, :got: stdin
    ldr x2, [x2]
    bl fgets
    cbz x0, .pfalse
    adr x0, sys_source_str
    add x1, x0, #32
    mov x3, #0
.rfstr:
    ldrb w4, [x1], #1
    cbz w4, .rfend
    add x3, x3, #1
    b .rfstr
.rfend:
    str x3, [x0, #8]
    mov x1, #0
    str x1, [x0, #16]
    b .ptrue
