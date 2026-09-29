// native word .fmmod fm/mod
.fmmod:
    pop %rdi
    pop %rdx
    pop %rax
    movq %rdx, %rsi
    xor %rdi, %rsi
    idiv %rdi
    push %rdx
    push %rax
    cmp $0, %rdx
    je .next
    cmp $0, %rsi
    jnl .next
    addq %rdi, 8(%rsp)
    subq $1, (%rsp)
    jmp .next
