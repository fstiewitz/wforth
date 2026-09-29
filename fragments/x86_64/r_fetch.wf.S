// native word .r_fetch r@
.r_fetch:
    movq -8(%r13), %rax
    push %rax
    jmp .next
