// native immediate word .line_comment \
.line_comment:
    leaq sys_source_str(%rip), %rax
    movq 8(%rax), %rdi
    movq %rdi, 16(%rax)
    jmp .next
