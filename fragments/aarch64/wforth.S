.section .rodata.ver
WFORTH_INFO0:
.ascii "#############################################"
.ascii "#                                           #"
.ascii "#         +----------------------+          #"
.ascii "#         |                      |          #"
.ascii "#         |        WFORTH        |          #"
.ascii "#         |  IN AARCH64 ASSEMBLY |          #"
.ascii "#         |  USING 64 BIT CELLS  |          #"
.ascii "#         |  @COPYLEFT           |          #"
.ascii "#         |  ALL WRONGS RESERVD  |          #"
.ascii "#         |                      |          #"
.ascii "#         +----------------------+          #"
.ascii "#                                           #"
WFORTH_INFO1:
.ascii "# THIS IS A MINIMAL IMPLEMENTATION OF FORTH #"
.ascii "# FOR AARCH64 USING INDIRECT THREADED CODE. #"
.ascii "# JUST ENOUGH TO PASS CORE TESTS.           #"
.ascii "#                                           #"
.ascii "# ARCHITECTURE                              #"
.ascii "# ============                              #"
.ascii "# REGISTERS                                 #"
.ascii "# ---------                                 #"
.ascii "# - X22 = IP                                #"
.ascii "# - X20 = DATA STACK (GROWS DOWN)           #"
.ascii "# - X19 = RETURN STACK (GROWS UP)           #"
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
MACRO cell-size 8
MACRO align-cellsize .balign 8
MACRO put-cell .quad
WFORTH_INFO2:
.section .bss
.data_stack:
.fill 256, 8
.return_stack:
.fill 256, 8
.hereptr:
.quad 0
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
memory:
.fill 32000, 1
.section .text
main:
.globl main
    stp x22, lr, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
    stp x21, fp, [sp, #-16]!
    mov fp, sp
    adr x21, .return_stack

    adr x22, quit
    add x22, x22, #8
    b .quit
.section .data.ref
.refdata:
    .quad WFORTH_INFO0
    .quad WFORTH_INFO1
    .quad WFORTH_INFO2
.section .data.mem
.globl current
