// native word .rot rot
.rot:
    pop %rdx
    pop %rsi
    pop %rdi
    push %rsi
    push %rdx
    push %rdi
    jmp .next
