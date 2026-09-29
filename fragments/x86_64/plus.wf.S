// native word .cadd +
.cadd:
    pop %rsi
    addq %rsi, (%rsp)
    jmp .next
