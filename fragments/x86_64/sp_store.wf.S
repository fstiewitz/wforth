// native word .sp_store sp!
.sp_store:
    movq (%rsp), %rsp
    jmp .next
