// native word .refs (refs)
.refs:
    adr x0, .refdata
    str x0, [x20, #-8]!
    b .next
