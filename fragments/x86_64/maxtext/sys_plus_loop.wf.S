// native word .ploop (+loop)
.ploop:
    movq (%rsp), %rax
    movq -16(%r13), %rdi
    movq -8(%r13), %rsi
    addq %rax, -16(%r13)
    sub %rsi, %rdi
    movq %rdi, %rsi
    xor %rax, %rsi
    add %rdi, %rax
    xor %rdi, %rax
    and %rsi, %rax
    cmp $0, %rax
    jnl .rfalse
    sub $16, %r13
    jmp .rtrue
