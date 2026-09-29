// native immediate word .s_quote s"
.s_quote:
    movq .hereptr(%rip), %rax
    leaq sys_str(%rip), %rdi
    movq %rdi, (%rax)
    addq $16, %rax
    leaq sys_source_str(%rip), %rcx
    movq 8(%rcx), %rdx
    movq 16(%rcx), %rsi
    movq 24(%rcx), %rdi
    push %rcx
    // rax here rdi str rsi in rdx size
.s_quote0:
    cmp %rdx, %rsi
    jge .s_quote1
    movb (%rdi, %rsi, 1), %cl
    cmp $34, %cl
    je .s_quote1
    movb %cl, (%rax)
    addq $1, %rax
    addq $1, %rsi
    jmp .s_quote0
.s_quote1:
    pop %rdi
    movq .hereptr(%rip), %rdx
    movq %rax, .hereptr(%rip)
    subq %rdx, %rax
    subq $16, %rax
    movq %rax, 8(%rdx)
    addq $1, %rax
    addq %rax, 16(%rdi)
    jmp .doalign
