// native word .doaligned aligned
.doaligned:
    pop %rdi
    call .doalignsub
    push %rdi
    jmp .next
