// native word .is_imm ?immediate
.is_imm:
    pop %rax
    movq -8(%rax), %rdi
    and $1, %rdi
    cmp $0, %rdi
    je .pfalse
    jmp .ptrue
