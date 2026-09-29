// native word .number_bracket #>
.number_bracket:
    leaq sys_po(%rip), %rdi
    xor %rcx, %rcx
    movb 8(%rdi), %cl
    xor %rax, %rax
    movb $255, %al
    sub %cl, %al
    addq %rcx, %rdi
    addq $9, %rdi
    movq %rdi, 8(%rsp)
    movq %rax, (%rsp)
    jmp .next
