// native word .cmove_fwd cmove
.cmove_fwd:
    pop %rcx
    pop %rsi
    pop %rdi
.cmove_fwd0:
    cmp $0, %rcx
    je .next
    movb (%rdi), %al
    movb %al, (%rsi)
    add $1, %rsi
    add $1, %rdi
    sub $1, %rcx
    jmp .cmove_fwd0
