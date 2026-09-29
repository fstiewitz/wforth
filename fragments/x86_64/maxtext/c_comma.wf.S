// native word .ccomma c,
.ccomma:
    pop %rax
    movq .hereptr(%rip), %rdi
    movb %al, (%rdi)
    addq $1, .hereptr(%rip)
    jmp .next
