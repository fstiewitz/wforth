// native word .2div 2/
.2div:
    ldr x0, [x20]
    asr x0, x0, #1
    str x0, [x20]
    b .next
