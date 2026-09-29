// native immediate word .while while
.while:
    call .doif
    pop %rsi
    push %rdi
    push %rsi
    jmp .next
