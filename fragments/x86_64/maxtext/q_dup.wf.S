// native word .qdup ?dup
.qdup:
    movq (%rsp), %rax
    cmp $0, %rax
    je .next
    jmp .dup0
