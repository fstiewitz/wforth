// native immediate word .begin begin
.begin:
    movq .hereptr(%rip), %rax
    push %rax
    jmp .next
