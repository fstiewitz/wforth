// native word .variable (variable)
/*
 * behaviour of VARIABLEs: Push the data address
 *
 * +---------+
 * |.variable|
 * +---------+
 * |...      |
 * +---------+
 */
.variable:
    ld a0, (fp)
    addi a0, a0, 8
    sd a0, -8(sp)
    addi sp, sp, -8
    j .next
