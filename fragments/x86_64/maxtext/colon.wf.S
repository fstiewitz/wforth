// native word .colon :
.colon:
    call .docolon
    jmp .next
.docolon:
    movq $0, %rdi
    call .docreate
    leaq .docol(%rip), %rax
    movq .hereptr(%rip), %rdi
    movq %rax, -8(%rdi)
    leaq state(%rip), %rdi
    movq $-1, 8(%rdi)
    ret
