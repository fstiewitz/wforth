// native word .dup dup
.dup:
    movq (%rsp), %rax
.dup0:
    push %rax
    jmp .next
