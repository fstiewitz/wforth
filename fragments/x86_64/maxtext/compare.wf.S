// native word .compare compare
.compare:
    pop %rcx
    pop %rdx
    pop %rsi
    pop %rdi
.compare0:
    cmp $0, %rcx
    je .compare1
    cmp $0, %rsi
    je .compare1
    movb (%rdx), %al
    subb (%rdi), %al
    cmp $0, %al
    jg .ptrue
    jl .comparep
    add $1, %rdi
    add $1, %rdx
    sub $1, %rcx
    sub $1, %rsi
    jmp .compare0
.compare1:
    cmp %rcx, %rsi
    jb .ptrue
    ja .comparep
    jmp .pfalse
.comparep:
    push $1
    jmp .next
