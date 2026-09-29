step == 0 && /MEM START/ {step=1}
step == 1 && /CODE NATIVE IMMEDIATE/ {
    funs[$4] = mc
    labels[$5] = mc
    native[mc, "fn"] = $4
    native[mc++, "cn"] = $5
    imm[$4] = 1
    next
}
step == 1 && /CODE NATIVE/ {
    funs[$3] = mc
    labels[$4] = mc
    native[mc, "fn"] = $3
    native[mc++, "cn"] = $4
    next
}
step == 1 && /CODE START/ {step = 2; next}
step == 2 && $1 == ":" {
    step = 3
    lc = 0
    n = $2
    funs[n] = mc++
}
step == 3 && $(NF) == "immediate" && $(NF-1) == ";" {
    gsub(/^    /, "")
    forth[n, lc++] = $0
    step = 2
    imm[n] = 1
    next
}
step == 3 && $(NF) == ";" {
    gsub(/^    /, "")
    forth[n, lc++] = $0
    step = 2
    next
}
step == 3 {
    gsub(/^    /, "")
    forth[n, lc++] = $0
    next
}
/CODE END/ {step=4}
step == 4 && $1 == ".quit:" {step=5}
step >= 5 && $1 == ".section" {step = 7}
step >= 5 &&
    substr($1, length($1)) == ":" &&
    (substr($1, 1, length($1)-1)) in labels {
    step = 6
    n = substr($1, 1, length($1)-1)
    lc = 0
}
step == 6 && $1 == "#" {next}
step == 6 {code[n, lc++] = $0}

BEGIN {
    for(i=33;i<127; ++i) {
        ascii[sprintf("%c", i)] = i
    }
}

function hash(n,    i, r) {
    r = ""
    for(i=1;i<=length(n); ++i) {
        r = r sprintf("%02x", ascii[substr(n, i, 1)])
    }
    return r
}

END {
    while(1 == getline < "lists/core.txt") {
        name_map[$1] = $2
    }
    for(n in funs) {
        forth_name = n
        if(!(n in name_map)) {
            print "not found", n
            exit 1
        }
        fn = "fragments/" name_map[n]
        h = hash(n)
        mc = funs[n]
        if((mc, "cn") in native) {
            cn = native[mc, "cn"]
            print "native word", n, native[mc, "cn"]
            if(n in imm)
                print "// native immediate word", cn, n > fn ".wf.S"
            else
                print "// native word", cn, n > fn ".wf.S"
            lc = 0
            while((cn, lc) in code) {
                print code[cn, lc++] >> fn ".wf.S"
            }
        } else {
            print "forth word", n
            if(n in imm)
                print "\\ forth immediate word", n > fn ".wf.fr"
            else
                print "\\ forth word", n > fn ".wf.fr"
            lc = 0
            while((n, lc) in forth) {
                print forth[n, lc++] >> fn ".wf.fr"
            }
        }
    }
}
