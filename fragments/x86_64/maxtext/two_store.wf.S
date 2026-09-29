// native word .2store 2!
.2store:
    pop %rax
    pop %rsi
    pop %rdi
    movq %rsi, (%rax)
    movq %rdi, 8(%rax)
    jmp .next
