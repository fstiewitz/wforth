// native word .docol (:)
.docol:
//    mov x0, x22
//    bl docol_trace
    ldr x0, [x22]
.docol0:
    str x22, [x19], #8
    mov x22, x0
    b .next
