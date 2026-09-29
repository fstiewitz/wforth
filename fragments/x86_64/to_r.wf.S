// native word .to_r >r
.to_r:
    pop %rax
    movq %rax, (%r13)
    add $8, %r13
    jmp .next
