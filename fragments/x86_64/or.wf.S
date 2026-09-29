// native word .cor or
.cor:
    pop %rsi
    orq %rsi, (%rsp)
    jmp .next
