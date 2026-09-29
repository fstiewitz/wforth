// native word .ult u<
.ult:
    pop %rsi
    pop %rdi
    cmp %rsi, %rdi
    jb .ptrue
    jmp .pfalse
