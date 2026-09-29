// native word .2div 2/
.2div:
    ld a0, (sp)
    srai a0, a0, 1
    sd a0, (sp)
    j .next
