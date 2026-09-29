// native word .toin >in
.toin:
    lea sys_source_str(%rip), %rax
    addq $16, %rax
    push %rax
    jmp .next
