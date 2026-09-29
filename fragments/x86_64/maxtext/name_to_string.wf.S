// native word .nametostring name>string
.nametostring:
    pop %rdi
    addq $8, %rdi
    movq %rdi, %rsi
    call .ntw
    subq $1, %rdi
    push %rsi
    subq %rsi, %rdi
    push %rdi
    jmp .next
