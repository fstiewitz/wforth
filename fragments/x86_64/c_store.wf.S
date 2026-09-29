// native word .cstore c!
.cstore:
    pop %rdi
    pop %rsi
    mov %sil, (%rdi)
    jmp .next
