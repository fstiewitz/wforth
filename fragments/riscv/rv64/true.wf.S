// native word .ptrue true
.ptrue:
    addi sp, sp, -8
.rtrue:
    li a0, -1
    sd a0, (sp)
    j .next
