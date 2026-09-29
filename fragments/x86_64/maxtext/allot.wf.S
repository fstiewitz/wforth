// native word .allot allot
.allot:
    pop %rax
    addq %rax, .hereptr(%rip)
    jmp .next
