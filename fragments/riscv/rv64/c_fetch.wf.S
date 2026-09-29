// native word .cfetch c@
.cfetch:
    ld a0, (sp)
    lbu a0, (a0)
    sd a0, (sp)
    j .next
