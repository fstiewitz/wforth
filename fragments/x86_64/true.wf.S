// native word .ptrue true
.ptrue:
    sub $8, %rsp
.rtrue:
    movq $-1, (%rsp)
    jmp .next
