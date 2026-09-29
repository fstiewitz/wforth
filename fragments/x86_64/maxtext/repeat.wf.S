// native immediate word .repeat repeat
.repeat:
    pop %rdx
    call .doagain
    jmp .then
