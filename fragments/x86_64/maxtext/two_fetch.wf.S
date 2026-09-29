// native word .2fetch 2@
.2fetch:
    pop %rax
    movq (%rax), %rdi
    movq 8(%rax), %rsi
    push %rsi
    push %rdi
    jmp .next
