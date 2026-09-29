// native word .ccr cr
.ccr:
    movq $10, %rdi
    call putchar
    jmp .next
