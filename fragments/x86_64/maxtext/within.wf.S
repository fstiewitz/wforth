// native word .within within
.within:
    pop %rsi
    pop %rdi
    pop %rax
    cmp %rdi, %rax
    jl .pfalse
    cmp %rsi, %rax
    jg .pfalse
    jmp .ptrue
