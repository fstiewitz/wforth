// native word .parse_name (parse-name)
.parse_name:
    pop %rcx
    call .parse_name0
    push %rdi
    push %rax
    jmp .next
.parse_name0:
    leaq sys_source_str(%rip), %rdi
    movq 8(%rdi), %rdx
    movq 16(%rdi), %rax
    movq 24(%rdi), %rdi
    addq %rax, %rdi
// rdx count rax >in rdi str rcx delim
    cmp $32, %rcx
    jne .parse_name1
.parse_name_ws:
    cmp %rdx, %rax
    jge .parse_name_err
    movb (%rdi), %sil
    cmp $32, %sil
    jg .parse_name1
    addq $1, %rdi
    addq $1, %rax
    jmp .parse_name_ws
.parse_name1:
    push %rdi
    push %rax
.parse_name2:
    cmp %rdx, %rax
    jge .parse_name3
    movb (%rdi), %sil
    cmp $32, %rcx
    je .parse_name_del_ws
    cmp %sil, %cl
    je .parse_name_exit
.parse_name_cont:
    addq $1, %rdi
    addq $1, %rax
    jmp .parse_name2
.parse_name_del_ws:
    cmp $32, %sil
    jle .parse_name_exit
    jmp .parse_name_cont
.parse_name3:
    leaq sys_source_str(%rip), %rcx
    movq %rdi, 16(%rcx)
    subq %rax, (%rsp)
    negq (%rsp)
    pop %rax
    pop %rdi
    ret
.parse_name_exit:
    leaq sys_source_str(%rip), %rcx
    movq %rax, 16(%rcx)
    addq $1, 16(%rcx)
    subq %rax, (%rsp)
    negq (%rsp)
    pop %rax
    pop %rdi
    ret
.parse_name_err:
    leaq sys_source_str(%rip), %rcx
    movq %rdx, 8(%rcx)
    movq %rdx, 16(%rcx)
    movq $0, %rdi
    movq $0, %rax
    ret
