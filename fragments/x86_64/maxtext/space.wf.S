// native word .space space
.space:
    movq $32, %rdi
    call putchar
    jmp .next
