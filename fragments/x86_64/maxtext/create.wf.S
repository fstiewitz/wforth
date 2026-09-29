// native word .create create
.create:
    movq $2, %rdi
    call .docreate
    movq .hereptr(%rip), %rdi
    movq sys_doing0(%rip), %rax
    leaq sys_doing1(%rip), %rdx
    movq %rax, -8(%rdi)
    movq %rdx, (%rdi)
    movq $0, 8(%rdi)
    addq $16, .hereptr(%rip)
    jmp .finish
