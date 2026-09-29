// native word .nametoword name>word
.nametoword:
    pop %rdi
    addq $8, %rdi
    movq %rdi, %rsi
    call .ntw
    addq $8, %rdi
    push %rdi
    jmp .doaligned
.ntw:
    movb (%rdi), %al
    addq $1, %rdi
    cmp $0, %al
    je .ntw1
    jmp .ntw
.ntw1:
    ret
