// native word .cdiv /
.cdiv:
    movq 8(%rsp), %rax
    cqo
    idivq (%rsp)
    movq %rax, 8(%rsp)
    jmp .drop
