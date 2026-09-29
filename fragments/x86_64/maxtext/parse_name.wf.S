// native word .parse_name_bl parse-name
.parse_name_bl:
    movq $32, %rcx
    call .parse_name0
    push %rdi
    push %rax
    jmp .next
