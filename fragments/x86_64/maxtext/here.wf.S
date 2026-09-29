// native word .phereval here
.phereval:
    movq .hereptr(%rip), %rax
    push %rax
    jmp .next
