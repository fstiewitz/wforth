// native word .phere (here)
.phere:
    lea .hereptr(%rip), %rax
    push %rax
    jmp .next
