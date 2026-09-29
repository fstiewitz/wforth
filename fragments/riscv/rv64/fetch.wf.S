// native word .fetch @
.fetch:
    ld a0, (sp)
    ld a0, (a0)
    sd a0, (sp)
    j .next
