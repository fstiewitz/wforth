// native word .hex hex
.hex:
    leaq base(%rip), %rax
    movq $16, 8(%rax)
    jmp .next
