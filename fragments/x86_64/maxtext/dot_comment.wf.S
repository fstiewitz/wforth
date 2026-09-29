// native immediate word .dot_paren .(
.dot_paren:
    movq $41, %rcx
    call .parse_name0
    push %rdi
    push %rax
    jmp .type
