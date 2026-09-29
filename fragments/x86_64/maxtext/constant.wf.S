// native word .constant constant
.constant:
    call .docolon
    pop %rsi
    call .doliteral
    jmp .endcode
