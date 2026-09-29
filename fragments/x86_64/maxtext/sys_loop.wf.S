// native word .loop (loop)
.loop:
    movq -8(%r13), %rsi
    addq $1, -16(%r13)
    cmp -16(%r13), %rsi
    jne .pfalse
    sub $16, %r13
    jmp .ptrue
