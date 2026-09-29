// native word .tobody >body
.tobody:
    pop %rax
    call .tobodyproc
    push %rax
    jmp .next
.tobodyproc:
    lea .doing0(%rip), %rdi
    cmp %rdi, (%rax)
    je .tobody_create
    lea .doing(%rip), %rdi
    cmp %rdi, (%rax)
    je .tobody_create
    add $8, %rax
    ret
.tobody_create:
    add $24, %rax
    ret
