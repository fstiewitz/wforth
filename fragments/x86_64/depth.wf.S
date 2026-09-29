// native word .depth depth
.depth:
    movq %rsp, %rdi
    movq %rbp, %rax
    sub $16, %rax
    sub %rdi, %rax
    shr $3, %rax
    push %rax
    jmp .next
