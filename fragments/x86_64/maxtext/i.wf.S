// native word .pi i
.pi:
    movq -16(%r13), %rax
    push %rax
    jmp .next
