// native word .refs (refs)
.refs:
    lea .refdata(%rip), %rax
    push %rax
    jmp .next
