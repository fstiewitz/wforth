// native word .min min
.min:
    pop %rsi
    pop %rdi
    cmp %rsi, %rdi
    jl .pdi
    jmp .psi
