// native immediate word .comment (
.comment:
    movq $41, %rcx
    call .parse_name0
    jmp .next
