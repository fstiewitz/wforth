// native word .cpush (push)
.cpush:
    movq 8(%rbx), %rax
    push %rax
    add $8, %rbx
    jmp .next
