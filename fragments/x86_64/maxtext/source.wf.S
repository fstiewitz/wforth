// native word .source source
.source:
    lea sys_source_str(%rip), %rax
    movq 8(%rax), %rdi
    movq 24(%rax), %rsi
    push %rsi
    push %rdi
    jmp .next
