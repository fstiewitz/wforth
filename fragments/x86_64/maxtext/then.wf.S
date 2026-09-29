// native immediate word .then then
.then:
    pop %rax
    movq .hereptr(%rip), %rdi
    subq %rax, %rdi
    movq %rdi, (%rax)
    jmp .next
