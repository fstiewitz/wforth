// native word .execute execute
.execute:
    pop %rax
    movq -8(%rax), %rdi
    and $2, %rdi
    cmp $0, %rdi
    je .docol0
    call .tobodyproc
    push %rax
    jmp .next
