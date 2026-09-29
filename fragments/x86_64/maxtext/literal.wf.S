// native immediate word .literal literal
.literal:
    pop %rsi
    call .doliteral
    jmp .next
.doliteral:
    movq .hereptr(%rip), %rdi
    lea sys_push(%rip), %rax
    movq %rax, (%rdi)
    movq %rsi, 8(%rdi)
    addq $16, .hereptr(%rip)
    ret
