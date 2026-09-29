// native word .2over 2over
.2over:
    movq 24(%rsp), %rdi
    movq 16(%rsp), %rsi
    push %rdi
    push %rsi
    jmp .next
