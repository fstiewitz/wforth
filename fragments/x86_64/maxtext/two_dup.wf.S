// native word .2dup 2dup
.2dup:
    pop %rsi
    pop %rdi
    push %rdi
    push %rsi
    push %rdi
    push %rsi
    jmp .next
