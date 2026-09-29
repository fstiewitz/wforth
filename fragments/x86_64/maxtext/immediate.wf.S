// native word .immediate immediate
.immediate:
    leaq current(%rip), %rdi
    movq 8(%rdi), %rdi
    addq $8, %rdi
    call .ntw
    addq $8, %rdi
    call .doalignsub
    orq $1, -8(%rdi)
    jmp .next
