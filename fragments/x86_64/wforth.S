.section .rodata.ver
WFORTH_INFO0:
.ascii "#############################################"
.ascii "#                                           #"
.ascii "#         +----------------------+          #"
.ascii "#         |                      |          #"
.ascii "#         |        WFORTH        |          #"
.ascii "#         |  IN X86-64 ASSEMBLY  |          #"
.ascii "#         |  USING 64 BIT CELLS  |          #"
.ascii "#         |  @COPYLEFT           |          #"
.ascii "#         |  ALL WRONGS RESERVD  |          #"
.ascii "#         |                      |          #"
.ascii "#         +----------------------+          #"
.ascii "#                                           #"
WFORTH_INFO1:
.ascii "# THIS IS A MINIMAL IMPLEMENTATION OF FORTH #"
.ascii "# FOR X86_64 USING INDIRECT THREADED CODE.  #"
.ascii "# JUST ENOUGH TO PASS CORE TESTS.           #"
.ascii "#                                           #"
.ascii "# ARCHITECTURE                              #"
.ascii "# ============                              #"
.ascii "# REGISTERS                                 #"
.ascii "# ---------                                 #"
.ascii "# - RBX = IP                                #"
.ascii "# - RSP = DATA STACK (GROWS DOWN)           #"
.ascii "# - R13 = RETURN STACK (GROWS UP)           #"
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
    push %rbp
    movq %rsp, %rbp
    push %rbx
    push %r13

    lea quit(%rip), %rbx
    add $8, %rbx
    jmp .quit
.section .data.ref
.refdata:
    .quad WFORTH_INFO0
    .quad WFORTH_INFO1
    .quad WFORTH_INFO2
.section .data.mem
.globl current
