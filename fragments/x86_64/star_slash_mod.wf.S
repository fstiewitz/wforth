// native word .mdivmod */mod
.mdivmod:
    movq 8(%rsp), %rax
    imulq 16(%rsp)
    idivq (%rsp)
    add $8, %rsp
    movq %rdx, 8(%rsp)
    movq %rax, (%rsp)
    jmp .next
