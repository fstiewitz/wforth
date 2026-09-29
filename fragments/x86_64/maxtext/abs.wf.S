// native word .abs abs
.abs:
    cmpq $0, (%rsp)
    jl .negate
    jmp .next
