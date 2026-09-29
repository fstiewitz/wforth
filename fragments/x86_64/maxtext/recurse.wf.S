// native immediate word .recurse recurse
.recurse:
    leaq sys_current(%rip), %rdi
    movq 8(%rdi), %rdi
    addq $8, %rdi
    call .ntw
    addq $8, %rdi
    call .doalignsub
    push %rdi
    jmp .comma
