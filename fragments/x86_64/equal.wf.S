// native word .eq =
.eq:
    pop %rsi
    pop %rdi
    cmp %rsi, %rdi
    je .ptrue
    jmp .pfalse
