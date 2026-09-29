// native word .plusstore +!
.plusstore:
    pop %rdi
    pop %rax
    addq %rax, (%rdi)
    jmp .next
