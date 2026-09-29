// native word .fill fill
.fill:
    pop %rax
    pop %rcx
    pop %rdi
.fill0:
    cmp $0, %rcx
    je .next
    sub $1, %rcx
    movb %al, (%rdi)
    add $1, %rdi
    jmp .fill0
