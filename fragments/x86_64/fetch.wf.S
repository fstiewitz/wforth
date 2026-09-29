// native word .fetch @
.fetch:
    pop %rax
    movq (%rax), %rax
    push %rax
    jmp .next
