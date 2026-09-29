// native word .2swap 2swap
.2swap:
    pop %rcx
    pop %rdx
    pop %rsi
    pop %rdi
    push %rdx
    push %rcx
    push %rdi
    push %rsi
    jmp .next
