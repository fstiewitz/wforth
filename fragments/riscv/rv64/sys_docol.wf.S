// native word .docol (:)
.docol:
//    mv a0, fp
//    call docol_trace
    ld a0, (fp)
.docol0:
    sd fp, (s1)
    addi s1, s1, 8
    mv fp, a0
    j .next
