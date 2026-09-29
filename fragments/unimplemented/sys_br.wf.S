// native word .cbr (br)
/*
 * conditional branch (jump if not zero)
 *
 * +------+
 * |...   |
 * +------+         +------+
 * |(br)  | ------> |.cbr  |
 * +------+         +------+
 * |offset|
 * +------+
 * |...   |
 * +------+
 */
.cbr:
    ld a0, (sp)
    addi sp, sp, 8
    addi fp, fp, 8
    bnez a0, .next
    j .cjmp0
