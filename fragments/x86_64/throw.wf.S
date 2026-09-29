// native word .throw throw
.throw:
    pop %rax
    cmp $0, %rax
    je .next
    leaq sys_handler(%rip), %rdi
    movq 8(%rdi), %r13
    movq -8(%r13), %rsi
    movq %rsi, 8(%rdi)
    movq -16(%r13), %rsp
    subq $16, %r13
    addq $8, %rsp
    push %rax
    jmp .exit
