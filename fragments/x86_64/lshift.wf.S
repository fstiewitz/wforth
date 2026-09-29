// native word .lshift lshift
.lshift:
    pop %rsi
    pop %rdi
    mov %sil, %cl
    shl %cl, %rdi
    push %rdi
    jmp .next
