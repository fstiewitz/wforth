// native word .mdiv */
.mdiv:
    movq 8(%rsp), %rax
    imulq 16(%rsp)
    idivq (%rsp)
    add $16, %rsp
    movq %rax, (%rsp)
    jmp .next
