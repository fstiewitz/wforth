// native word .docol (:)
/*
 * behaviour of ':' words:
 *  1. save current ITC instruction pointer
 *  2. resume ITC execution at the first instruction of this word
 *
 *  +------+
 *  |.docol|
 *  +------+
 *  | ...  |
 *  +------+
 */
.docol:
//    mv a0, fp
//    call docol_trace
    ld a0, (fp)
.docol0:
    sd fp, (s1)
    addi s1, s1, 8
/*
 * we set IP to the cell containing '.docol'.
 * '.next' then increases IP to execute the first instruction.
 */
    mv fp, a0
    j .next
