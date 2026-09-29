// native word .inc1 char+
.inc1:
    addq $1, (%rsp)
    jmp .next
