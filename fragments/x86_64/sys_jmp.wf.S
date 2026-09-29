// native word .cjmp (jmp)
.cjmp:
    add $8, %rbx
.cjmp0:
    movq (%rbx), %rax
    lea (%rbx, %rax, 1), %rbx
    jmp .next0
