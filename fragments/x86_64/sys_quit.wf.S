// native word .quit (quit)
.quit:
    movq %rbp, %rsp
    sub $16, %rsp
    lea .return_stack(%rip), %r13
    lea memory(%rip), %rax
    movq %rax, .hereptr(%rip)
.next:
    add $8, %rbx
.next0:
    movq (%rbx), %rax
    movq (%rax), %rax
    jmp *%rax
