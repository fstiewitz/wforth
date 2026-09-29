// native word .mmul m*
.mmul:
    movq 8(%rsp), %rax
    imulq (%rsp)
    movq %rax, 8(%rsp)
    movq %rdx, (%rsp)
    jmp .next
