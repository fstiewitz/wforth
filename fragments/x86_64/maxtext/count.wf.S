// native word .count count
.count:
    xor %rax, %rax
    movq (%rsp), %rdi
    movb (%rdi), %al
    addq $1, (%rsp)
    push %rax
    jmp .next
