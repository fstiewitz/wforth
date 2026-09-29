// native word .emit emit
.emit:
    ld a0, (sp)
    addi sp, sp, 8
    call putchar
    j .next
