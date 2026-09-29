// native immediate word .dostate0 [
.dostate0:
    lea state(%rip), %rax
    movq $0, 8(%rax)
    jmp .next
