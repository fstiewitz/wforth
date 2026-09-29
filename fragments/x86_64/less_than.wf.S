// native word .lt <
.lt:
    pop %rsi
    pop %rdi
    cmp %rsi, %rdi
    jl .ptrue
    jmp .pfalse
