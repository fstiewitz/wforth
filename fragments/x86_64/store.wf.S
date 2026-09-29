// native word .store !
.store:
    pop %rdi
    pop %rsi
    movq %rsi, (%rdi)
    jmp .next
