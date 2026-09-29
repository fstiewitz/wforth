// native word .type type
.type:
    cmpq $0, (%rsp)
    je .type0
    movq 8(%rsp), %rax
    xor %rdi, %rdi
    movb (%rax), %dil
    call putchar
    subq $1, (%rsp)
    addq $1, 8(%rsp)
    jmp .type
.type0:
    addq $16, %rsp
    jmp .next
