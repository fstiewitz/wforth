// native word .exit exit
.exit:
    ld fp, -8(s1)
    addi s1, s1, -8
    j .next
