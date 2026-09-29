// native word .swap swap
.swap:
    pop %rsi
    pop %rdi
    push %rsi
    push %rdi
    jmp .next
