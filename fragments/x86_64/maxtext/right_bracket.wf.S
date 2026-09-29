// native word .dostate1 ]
.dostate1:
    lea state(%rip), %rax
    movq $-1, 8(%rax)
    jmp .next
