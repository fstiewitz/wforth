// native word .0lt 0<
.0lt:
    cmpq $0, (%rsp)
    jl .rtrue
    jmp .rfalse
