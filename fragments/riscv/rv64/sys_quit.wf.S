// native word .quit (quit)
.quit:
    mv sp, s7
    la s1, .return_stack
    la a0, memory
    sd a0, .hereptr, a1
.next:
    addi fp, fp, 8
.next0:
    ld a0, (fp)
    ld a0, (a0)
    jr a0
