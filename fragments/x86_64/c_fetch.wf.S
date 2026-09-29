// native word .cfetch c@
.cfetch:
    pop %rax
    xor %rdi, %rdi
    movb (%rax), %dil
    push %rdi
    jmp .next
