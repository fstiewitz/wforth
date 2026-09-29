// native word .cpush (push)
/*
 * assembled by LITERAL, literal constants, ['], S", etc.
 * pushes the value of the next cell and skips over it.
 *
 * +--------+
 * |...     |
 * +--------+
 * |(push)  |
 * +--------+
 * |constant|
 * +--------+
 * |...     |
 * +--------+
 */
.cpush:
    ld a0, 8(fp)
    sd a0, -8(sp)
    addi sp, sp, -8
    addi fp, fp, 8
    j .next
