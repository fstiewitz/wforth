// native word .nip nip
.nip:
    pop %rax
    pop %rdi
    push %rax
    jmp .next
