// native word .bracket_number <#
.bracket_number:
    leaq sys_po(%rip), %rax
    movb $255, 8(%rax)
    jmp .next
