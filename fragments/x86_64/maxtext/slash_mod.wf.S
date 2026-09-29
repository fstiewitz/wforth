// native word .divmod /mod
.divmod:
    movq 8(%rsp), %rax
    cqo
    idivq (%rsp)
    movq %rdx, 8(%rsp)
    movq %rax, (%rsp)
    jmp .next
