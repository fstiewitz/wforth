// native word .pfalse false
.pfalse:
    addi sp, sp, -8
.rfalse:
    sd x0, (sp)
    j .next
