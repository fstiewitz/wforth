// native immediate word .ahead ahead
.ahead:
    call .doahead
    push %rdi
    jmp .next
.doahead:
    leaq sys_jmp(%rip), %rdi
    movq .hereptr(%rip), %rsi
    movq %rdi, (%rsi)
    addq $8, %rsi
    movq $0, (%rsi)
    movq %rsi, %rdi
    addq $8, %rsi
    movq %rsi, .hereptr(%rip)
    ret
