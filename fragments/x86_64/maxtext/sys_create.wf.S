// native word .create_internal (create)
.create_internal:
    pop %rdi
    call .docreate
    jmp .next
.docreate:
    push %rdi
    movq .hereptr(%rip), %rdi
    call .doalignsub
    movq %rdi, .hereptr(%rip)
    movq $32, %rcx
    call .parse_name0
    cmp $0, %rax
    je .throw16

    movq .hereptr(%rip), %rsi
    leaq sys_current(%rip), %rdx
    leaq current(%rip), %rcx
    movq %rsi, 8(%rdx)
    movq 8(%rcx), %rcx
    movq %rcx, (%rsi)
    addq $8, %rsi

.create_internal0:
    cmp $0, %rax
    je .create_internal1
    movb (%rdi), %cl
    movb %cl, (%rsi)
    addq $1, %rsi
    addq $1, %rdi
    subq $1, %rax
    jmp .create_internal0
.create_internal1:
    movb $0, (%rsi)
    addq $1, %rsi
    movq %rsi, %rdi
    call .doalignsub
    pop %rax
    movq %rax, (%rdi)
    addq $8, %rdi
    leaq .variable(%rip), %rax
    movq %rax, (%rdi)
    addq $8, %rdi
    movq %rdi, .hereptr(%rip)
    ret
.throw16:
    push $-16
    jmp .throw
