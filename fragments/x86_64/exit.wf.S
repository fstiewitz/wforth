// native word .exit exit
.exit:
    sub $8, %r13
    movq (%r13), %rbx
    jmp .next
