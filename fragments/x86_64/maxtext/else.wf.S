// native immediate word .else else
.else:
    call .doahead
    pop %rsi
    push %rdi
    push %rsi
    jmp .then
