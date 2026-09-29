// native word .inc1 1+
.inc1:
    addq $1, (%rsp)
    jmp .next
