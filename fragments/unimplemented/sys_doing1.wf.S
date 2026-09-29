// native word .cdoing1 (doing1)
/*
 *  in CREATE'd words that have been DOES>'d this word will
 * be called. it has two jobs:
 *  1. push the data address of this word
 *  2. perform an unconditional jump to the DOES> code
 *
 * +--------+
 * |.doing  |
 * +--------+
 * |(doing1)|
 * +--------+
 * |offset  |
 * +--------+
 * |...     |
 * +--------+
 */
.cdoing1:
    addi a0, fp, 16
    sd a0, -8(sp)
    addi sp, sp, -8
    j .cjmp
