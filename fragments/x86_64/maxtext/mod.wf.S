// native word .cmod mod
.cmod:
    movq 8(%rsp), %rax
    cqo
    idivq (%rsp)
    movq %rdx, 8(%rsp)
    jmp .drop
