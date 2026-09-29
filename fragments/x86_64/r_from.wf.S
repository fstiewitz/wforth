// native word .r_from r>
.r_from:
    sub $8, %r13
    movq (%r13), %rax
    push %rax
    jmp .next
