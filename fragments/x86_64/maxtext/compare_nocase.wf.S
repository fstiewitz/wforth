// native word .compare_nc compare-nocase
.compare_nc:
    pop %rcx
    pop %rdx
    pop %rsi
    pop %rdi
.compare_nc0:
    cmp $0, %rcx
    je .compare_nc1
    cmp $0, %rsi
    je .compare_nc1
    movb (%rdx), %al
    cmp $97, %al
    jb .compare_nc_nocase0
    cmp $122, %al
    ja .compare_nc_nocase0
    sub $32, %al
.compare_nc_nocase0:
    cmpb $97, (%rdi)
    jb .compare_nc_nocase2
    cmpb $122, (%rdi)
    ja .compare_nc_nocase2
    push %cx
    movb (%rdi), %cl
    sub $32, %cl
    cmp %cl, %al
    pop %cx
    jmp .compare_nc_nocase3
.compare_nc_nocase2:
    subb (%rdi), %al
    cmp $0, %al
.compare_nc_nocase3:
    jg .ptrue
    jl .comparep
    add $1, %rdi
    add $1, %rdx
    sub $1, %rcx
    sub $1, %rsi
    jmp .compare_nc0
.compare_nc1:
    cmp %rcx, %rsi
    jb .ptrue
    ja .comparep
    jmp .pfalse
