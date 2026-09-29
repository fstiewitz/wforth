// native word .is_var ?variable
.is_var:
    pop %rax
    movq -8(%rax), %rdi
    and $2, %rdi
    cmp $0, %rdi
    je .pfalse
    jmp .ptrue
