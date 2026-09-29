// native word .cmul *
.cmul:
    movq 8(%rsp), %rax
    imulq (%rsp)
    movq %rax, 8(%rsp)
    jmp .drop
