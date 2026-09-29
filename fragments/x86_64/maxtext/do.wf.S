// native immediate word .do do
.do:
    leaq to_r(%rip), %rdi
    movq .hereptr(%rip), %rsi
    movq %rdi, (%rsi)
    movq %rdi, 8(%rsi)
    addq $16, %rsi
    movq %rsi, .hereptr(%rip)
    pushq $2
    push %rsi
    jmp .next
