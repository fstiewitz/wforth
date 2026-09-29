// native word .dovariable variable
.dovariable:
    movq $2, %rdi
    call .docreate
    movq .hereptr(%rip), %rax
    movq $0, (%rax)
    addq $8, %rax
    movq %rax, .hereptr(%rip)
    jmp .finish
