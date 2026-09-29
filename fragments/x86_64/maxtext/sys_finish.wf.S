// native word .finish (finish)
.finish:
    leaq sys_current(%rip), %rdi
    leaq current(%rip), %rsi
    movq 8(%rdi), %rax
    movq %rax, 8(%rsi)
    jmp .next
