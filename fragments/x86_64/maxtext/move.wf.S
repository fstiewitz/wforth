// native word .move move
.move:
    movq 8(%rsp), %rdi
    movq 16(%rsp), %rsi
    cmp %rdi, %rsi
    jb .cmove_back
    jmp .cmove_fwd
