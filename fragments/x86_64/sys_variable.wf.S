// native word .variable (variable)
.variable:
    movq (%rbx), %rax
    add $8, %rax
    push %rax
    jmp .next
