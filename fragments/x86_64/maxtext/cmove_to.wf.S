// native word .cmove_back cmove>
.cmove_back:
    pop %rcx
    pop %rsi
    pop %rdi
    add %rcx, %rsi
    add %rcx, %rdi
    sub $1, %rsi
    sub $1, %rdi
.cmove_back0:
    cmp $0, %rcx
    je .next
    movb (%rdi), %al
    movb %al, (%rsi)
    sub $1, %rsi
    sub $1, %rdi
    sub $1, %rcx
    jmp .cmove_back0
