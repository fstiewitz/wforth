// native word .quit (quit)
/*
 * the beginning of QUIT looks like this
 *     : QUIT (quit) ...
 * the main function jumps to (quit), i.e. the code below.
 * this code (re)sets the data stack, return stack and data
 * space pointer.
 * below that is the implementation of '.next', a label that
 * most native words jump to to move to the next ITC instruction.
 */
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
