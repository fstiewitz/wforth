// native word .doalign align
.doalign:
    movq .hereptr(%rip), %rdi
    call .doalignsub
    movq %rdi, .hereptr(%rip)
    jmp .next
.doalignsub:
    movq %rdi, %rsi
    and $7, %rsi
    cmp $0, %rsi
    je .doalignsub0
    and $-8, %rdi
    addq $8, %rdi
.doalignsub0:
    ret
