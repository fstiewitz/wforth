// native word .refill refill
.refill:
    lea sys_source_str(%rip), %rdi
    lea 32(%rdi), %rax
    movq %rax, 24(%rdi)
    add $32, %rdi
    movq $256, %rsi
    movq stdin(%rip), %rdx
    call fgets
    cmp $0, %rax
    je .pfalse
    lea sys_source_str(%rip), %rdi
    add $8, %rdi
    lea 24(%rdi), %rsi
    movq $0, %rax
.rfstr:
    movb (%rsi), %cl
    cmp $0, %cl
    je .rfend
    add $1, %rax
    add $1, %rsi
    jmp .rfstr
.rfend:
    movq %rax, (%rdi)
    movq $0, 8(%rdi)
    jmp .ptrue
