// native word .rshift rshift
.rshift:
    pop %rsi
    pop %rdi
    mov %sil, %cl
    shr %cl, %rdi
    push %rdi
    jmp .next
