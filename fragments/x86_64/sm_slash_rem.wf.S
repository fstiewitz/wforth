// native word .smrem sm/rem
.smrem:
    movq 16(%rsp), %rax
    movq 8(%rsp), %rdx
    idivq (%rsp)
    movq %rdx, 16(%rsp)
    movq %rax, 8(%rsp)
    jmp .drop
