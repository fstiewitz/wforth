// native word .umul um*
.umul:
    movq 8(%rsp), %rax
    mulq (%rsp)
    movq %rax, 8(%rsp)
    movq %rdx, (%rsp)
    jmp .next
