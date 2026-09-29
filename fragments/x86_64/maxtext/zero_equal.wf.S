// native word .0eq 0=
.0eq:
    cmpq $0, (%rsp)
    je .rtrue
    jmp .rfalse
