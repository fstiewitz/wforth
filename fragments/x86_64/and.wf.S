// native word .cand and
.cand:
    pop %rsi
    andq %rsi, (%rsp)
    jmp .next
