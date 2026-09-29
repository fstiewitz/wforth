// native immediate word .again again
.again:
    popq %rdx
    call .doagain
    jmp .next
.doagain:
    leaq sys_jmp(%rip), %rdi
    movq .hereptr(%rip), %rsi
    movq %rdi, (%rsi)
    addq $8, %rsi
    movq %rsi, %rdi
    subq %rdi, %rdx
    movq %rdx, (%rsi)
    addq $8, %rsi
    movq %rsi, .hereptr(%rip)
    ret
