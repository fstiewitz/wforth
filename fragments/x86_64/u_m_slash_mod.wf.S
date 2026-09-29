// native word .ummod um/mod
.ummod:
    movq 16(%rsp), %rax
    movq 8(%rsp), %rdx
    divq (%rsp)
    movq %rdx, 16(%rsp)
    movq %rax, 8(%rsp)
    jmp .drop
