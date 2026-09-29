// native word .comma ,
.comma:
    pop %rax
    movq .hereptr(%rip), %rdi
    movq %rax, (%rdi)
    addq $8, .hereptr(%rip)
    jmp .next
