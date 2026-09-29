// native word .cbye bye
.cbye:
    mov sp, fp
    ldp x21, fp, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x22, lr, [sp], #16
    ret
