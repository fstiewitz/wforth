// native word .stod s>d
.stod:
    movq (%rsp), %rax
    cmp $0, %rax
    jl .ptrue
    jmp .pfalse
