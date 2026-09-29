// native word .pfalse false
.pfalse:
    sub $8, %rsp
.rfalse:
    movq $0, (%rsp)
    jmp .next
.pstr:
    movq 8(%rbx), %rax
    lea 16(%rbx), %rdi
    push %rdi
    push %rax
    add $16, %rbx
    movq %rax, %rdi
    xor %rsi, %rsi
    and $7, %rax
    cmp $0, %rax
    setne %sil
    shl $3, %rsi
    and $-8, %rdi
    add %rsi, %rdi
    add %rdi, %rbx
    jmp .next0
