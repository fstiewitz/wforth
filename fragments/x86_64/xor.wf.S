// native word .cxor xor
.cxor:
    pop %rsi
    xorq %rsi, (%rsp)
    jmp .next
