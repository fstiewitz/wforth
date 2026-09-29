// native immediate word .endcode ;
.endcode:
    leaq exit(%rip), %rdi
    movq .hereptr(%rip), %rax
    movq %rdi, (%rax)
    addq $8, .hereptr(%rip)
    leaq state(%rip), %rdi
    movq $0, 8(%rdi)
    jmp .finish
