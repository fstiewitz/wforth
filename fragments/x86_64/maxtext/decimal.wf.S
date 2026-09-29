// native word .decimal decimal
.decimal:
    leaq base(%rip), %rax
    movq $10, 8(%rax)
    jmp .next
