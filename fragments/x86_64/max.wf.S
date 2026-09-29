// native word .max max
.max:
    pop %rsi
    pop %rdi
    cmp %rsi, %rdi
    jg .pdi
    jmp .psi
.pdi:
    push %rdi
    jmp .next
.psi:
    push %rsi
    jmp .next
