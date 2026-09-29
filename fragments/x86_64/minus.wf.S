// native word .csub -
.csub:
    pop %rsi
    subq %rsi, (%rsp)
    jmp .next
