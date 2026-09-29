// native immediate word .until until
.until:
    leaq sys_br(%rip), %rax
    movq .hereptr(%rip), %rdi
    movq %rax, (%rdi)
    addq $8, %rdi
    pop %rsi
    sub %rdi, %rsi
    movq %rsi, (%rdi)
    addq $16, .hereptr(%rip)
    jmp .next
