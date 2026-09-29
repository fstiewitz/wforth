// native word .cbr (br)
.cbr:
    pop %rax
    add $8, %rbx
    cmp $0, %rax
    jne .next
    jmp .cjmp0
