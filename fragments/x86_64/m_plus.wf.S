// native word .madd m+
.madd:
    pop %rdi
    addq %rdi, 8(%rsp)
    adcq $0, (%rsp)
    jmp .next
