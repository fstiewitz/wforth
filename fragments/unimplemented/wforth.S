.section .rodata.ver
/*
 * this optional info block will be printed with WFORTH
 * you can remove it to save space.
 */
WFORTH_INFO0:
.ascii "#############################################"
.ascii "#                                           #"
.ascii "#         +----------------------+          #"
.ascii "#         |                      |          #"
.ascii "#         |        WFORTH        |          #"
.ascii "#         |  @COPYLEFT           |          #"
.ascii "#         |  ALL WRONGS RESERVD  |          #"
.ascii "#         |                      |          #"
.ascii "#         +----------------------+          #"
.ascii "#                                           #"
WFORTH_INFO1:
.ascii "# THIS INFO BLOCK CAN BE PRINTED WITH THE   #"
.ascii "# WORD 'WFORTH'.                            #"
.ascii "# ALL LINES ARE EXACTLY 45 CHARACTERS LONG. #"
.ascii "#                                           #"
.ascii "# ARCHITECTURE                              #"
.ascii "# ============                              #"
.ascii "# REGISTERS                                 #"
.ascii "# ---------                                 #"
.ascii "# - MYREG0 = IP                             #"
.ascii "# - MYREG1 = DATA STACK (GROWS DOWN)        #"
.ascii "# - MYREG2 = RETURN STACK (GROWS UP)        #"
.ascii "# WORD FORMAT                               #"
.ascii "# -----------                               #"
.ascii "#       MOST WORDS                          #"
.ascii "#       +-------------+                     #"
.ascii "# NT -> | LINK        |                     #"
.ascii "#       +-------------+                     #"
.ascii "#       | NAME ...  0 |                     #"
.ascii "#       +-------------+                     #"
.ascii "#       | (PADDING)   |                     #"
.ascii "#       +-------------+                     #"
.ascii "#       | FLAGS       |                     #"
.ascii "#       +-------------+                     #"
.ascii "# XT -> | CODE PTR    |                     #"
.ascii "#       +-------------+                     #"
.ascii "#       | ...         |                     #"
.ascii "#       +-------------+                     #"
.ascii "#       CREATE          CREATE DOES>        #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "# NT -> | LINK        | | LINK        |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#       | NAME ...  0 | | NAME ...  0 |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#       | (PADDING)   | | (PADDING)   |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#       | FLAGS       | | FLAGS       |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "# XT -> | DOING0      | | DOING       |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#       | DOING1      | | DOING1      |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#       | 0           | | DOES> PTR   |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#       | ...         | | ...         |     #"
.ascii "#       +-------------+ +-------------+     #"
.ascii "#############################################"
WFORTH_INFO2:
/*
 * these MACRO lines are directives to the wforth assembler script.
 * adjust these accordingly.
 */
MACRO cell-size 8
MACRO align-cellsize .balign 8
MACRO put-cell .quad
.section .bss
/*
 * here we reserve space for the return stack
 */
.return_stack:
.fill 256, 8
/*
 * here we reserve space for (here)
 */
.hereptr:
.quad 0
/*
 * the following variables are used by the C interface if the function
 * returns multiple values (or more than the ABI expects).
 * see 'codegen-c.sh' in the profile folder for details.
 * if you do not use '.wf.c' files, you can remove these.
 */
wforth_c_s0:
.globl wforth_c_s0
.quad 0
wforth_c_s1:
.globl wforth_c_s1
.quad 0
wforth_c_s2:
.globl wforth_c_s2
.quad 0
wforth_c_s3:
.globl wforth_c_s3
.quad 0
/*
 * here we reserve space for the data space (used by ALLOT , C, etc.)
 */
memory:
.fill 32000, 1
.section .text
.globl current
main:
.globl main
/*
 * standard function preamble
 */
    sd ra, -8(sp)
    sd fp, -16(sp)
    sd s1, -24(sp)
    addi sp, sp, -24
/*
 * one callee-saved register is used to store the stack start for DEPTH.
 */
    mv s7, sp

/*
 * jump to (quit), which will be the first thing called by QUIT.
 */
    la fp, quit
    addi fp, fp, 8
    j .quit
.section .data.ref
/*
 * the following array can be used by internal words to get important
 * code pointers. right now we only use it for WFORTH.
 */
.refdata:
    .quad WFORTH_INFO0
    .quad WFORTH_INFO1
    .quad WFORTH_INFO2
.section .data.mem
