// native word .sstring /string
.sstring:
    pop %rax
    subq %rax, (%rsp)
    addq %rax, 8(%rsp)
    jmp .next
