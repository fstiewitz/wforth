// native immediate word .if if
.if:
    call .doif
    push %rdi
    jmp .next
.doif:
    leaq sys_br(%rip), %rax
    movq .hereptr(%rip), %rdi
    movq %rax, (%rdi)
    movq $0, 8(%rdi)
    addq $8, %rdi
    addq $16, .hereptr(%rip)
    ret
