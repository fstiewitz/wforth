// native word .doing0 (doing0)
/*
 *  in CREATE'd words that have NOT been DOES>'d this
 * implements the behavior of the created word.
 * That is, push the data address.
 *
 * +--------+
 * |.doing0 |
 * +--------+
 * |(doing1)|
 * +--------+
 * |XXXXXXXX|
 * +--------+
 * |...     |
 * +--------+
 */
.doing0:
    ld a0, (fp)
    addi a0, a0, 24
    sd a0, -8(sp)
    addi sp, sp, -8
    j .next
