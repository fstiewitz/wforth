// native word .gt >
.gt:
    pop %rsi
    pop %rdi
    cmp %rsi, %rdi
    jg .ptrue
    jmp .pfalse
