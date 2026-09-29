// native word .docol (:)
.docol:
    movq (%rbx), %rax
.docol0:
    movq %rbx, (%r13)
    add $8, %r13
    movq %rax, %rbx
    jmp .next
