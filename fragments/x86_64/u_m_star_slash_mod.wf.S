// native word .ummdivmod um*/mod
.ummdivmod:
    movq 8(%rsp), %rdi
    movq 24(%rsp), %rax
    mul %rdi // mul lower
    movq %rax, %rsi
    movq %rdx, %rcx
    movq 16(%rsp), %rax
    mul %rdi // mul upper
    add %rcx, %rax
    // rdx:rax:rsi
    movq (%rsp), %rdi
    div %rdi
    movq %rax, 16(%rsp)
    movq %rsi, %rax
    div %rdi
    movq %rax, 24(%rsp)
    movq %rdx, 8(%rsp)
    add $8, %rsp
    jmp .next
