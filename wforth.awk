function add_line(x) {
    lines[LC++] = x
}

function getcanon(n) {
    if(! n in canon) {
        print "canonical name not found", n >> "/dev/stderr"
        exit 1
    }
    if(canon[n]=="") {
        print "canonical name error for", n >> "/dev/stderr"
        exit 1
    }
    return canon[n]
}

function fnh(n, fl) {
    h = n
    gsub(/\\/, "\\\\", n)
    gsub(/"/, "\\\"", n)
    add_line(cmd["align-cellsize"])
    add_line("\".name." getcanon(h) "\":")
    if(current == "") {
        add_line(cmd["put-cell"] " 0")
    } else {
        add_line(cmd["put-cell"] " .name." current)
    }
    add_line(".asciz \"" n "\"")
    add_line(cmd["align-cellsize"])
    fns[getcanon(h)] = LC
    add_line(cmd["put-cell"] " " fl)
    add_line(getcanon(h) ":")
    current = getcanon(h)
    return n
}

function compile() {
    i=1
    while(i<=NF) {
        if($(i)==":" && st == 0) {
            st = 1
            fnh($(i+1), 0)
            add_line(cmd["put-cell"] " .docol")
            i = i + 1
        } else if($(i)=="\\") {
            return;
        } else if($(i)=="immediate") {
            lines[fns[current]] = cmd["put-cell"] " 1"
            imm[current] = 1
        } else if($(i)==";") {
            st = 0
            add_line(cmd["put-cell"] " exit")
        } else if($(i)=="2variable") {
            fnh($(i+1), 2)
            add_line(cmd["put-cell"] " .variable")
            add_line(cmd["put-cell"] " 0")
            add_line(cmd["put-cell"] " 0")
            i = i + 1
        } else if($(i)=="variable") {
            fnh($(i+1), 2)
            add_line(cmd["put-cell"] " .variable")
            add_line(cmd["put-cell"] " 0")
            i = i + 1
        } else if($(i+2)=="buffer:") {
            fnh($(i+3), 2)
            add_line(cmd["put-cell"] " .variable")
            if($(i+1)=="chars") {
                add_line(".fill " $(i) ", 1")
            } else {
                add_line(".fill " $(i) ", " cmd["cell-size"])
            }
            i = i + 4
        } else if($(i)=="begin") {
            cst[CS++, "pos"] = LC
        } else if($(i)=="repeat") {
            add_line(cmd["put-cell"] " sys_jmp");
            add_line(cmd["put-cell"] " " (cmd["cell-size"]*(cst[--CS, "pos"] - LC)));
            lpos = cst[--CS, "pos"]
            lines[lpos] = cmd["put-cell"] " " (cmd["cell-size"]*(LC - lpos));
        } else if($(i)=="while") {
            lpos = cst[CS-1, "pos"]
            add_line(cmd["put-cell"] " sys_br");
            cst[CS-1, "pos"] = LC;
            cst[CS++, "pos"] = lpos;
            add_line(cmd["put-cell"] " 0");
        } else if($(i)=="else") {
            lpos = cst[CS-1, "pos"]
            add_line(cmd["put-cell"] " sys_jmp");
            cst[CS-1, "pos"] = LC;
            add_line(cmd["put-cell"] " 0");
            lines[lpos] = cmd["put-cell"] " " (cmd["cell-size"]*(LC - lpos));
        } else if($(i)=="if") {
            add_line(cmd["put-cell"] " sys_br");
            cst[CS++, "pos"] = LC;
            add_line(cmd["put-cell"] " 0")
        } else if($(i)=="until") {
            add_line(cmd["put-cell"] " sys_br");
            add_line(cmd["put-cell"] " " (cmd["cell-size"]*(cst[--CS, "pos"] - LC)))
        } else if($(i)=="then") {
            lpos = cst[--CS, "pos"]
            lines[lpos] = cmd["put-cell"] " " (cmd["cell-size"]*(LC - lpos));
        } else if($(i)=="postpone") {
            n = $(i+1)
            gsub(/\\/, "\\\\", n)
            gsub(/"/, "\\\"", n)
            if(getcanon($(i+1)) in imm) {
                add_line(cmd["put-cell"] " " getcanon($(i+1)))
            } else {
                add_line(cmd["put-cell"] " sys_push")
                add_line(cmd["put-cell"] " " getcanon($(i+1)))
                add_line(cmd["put-cell"] " compile_comma")
            }
            i = i + 1
        } else if($(i)=="[']") {
            add_line(cmd["put-cell"] " sys_push")
            add_line(cmd["put-cell"] " " getcanon($(i+1)))
            i = i + 1
        } else if($(i)=="(string-word)") {
            add_line(cmd["put-cell"] " sys_str")
            add_line(cmd["put-cell"] " " length($(i+1)))
            for(j=0;j<length($(i+1));j+=cmd["cell-size"]) {
                ss = substr($(i+1),1+j,cmd["cell-size"])
                pad = ""
                if(length(ss)%cmd["cell-size"]) {
                    for(k=0;k<cmd["cell-size"]-length(ss)%cmd["cell-size"];++k) {
                        pad = pad " "
                    }
                }
                add_line(".ascii \"" ss pad "\"")
            }
            i = i + 1
        } else if(match($(i), /^-?[0-9]+$/)) {
            add_line(cmd["put-cell"] " sys_push")
            add_line(cmd["put-cell"] " " $(i))
        } else {
            add_line(cmd["put-cell"] " " getcanon($(i)))
        }
        i = i + 1
    }
}

/MEM START/ {
    current = ""
    st = 0
    canon["current"] = "current"
    canon["(source-str)"] = "sys_source_str"
    canon["state"] = "state"
    canon["(errno)"] = "sys_errno"
    fnh("current", 2)
    add_line(cmd["put-cell"] " .variable")
    m=LC
    add_line("")
    fnh("(source-str)", 2)
    add_line(cmd["put-cell"] " .variable")
    add_line(cmd["put-cell"] " 0")
    add_line(cmd["put-cell"] " 0")
    add_line(cmd["put-cell"] " 0")
    add_line(".fill 256, 1")
    next
}
/MEM END/ {
    lines[m] = cmd["put-cell"] " .name." current
    m=0
    for(i=0;i<LC;++i) {
        print lines[i]
    }
    next
}
/CODE NATIVE IMMEDIATE/ {
    canon[$4] = $6
    fnh($4, 1)
    imm[$6] = 1
    add_line(cmd["put-cell"] " " $5)
    add_line(cmd["put-cell"] " " $6)
    add_line(cmd["put-cell"] " exit")
    next
}
/CODE NATIVE/ {
    canon[$3] = $5
    fnh($3, 0)
    add_line(cmd["put-cell"] " " $4)
    add_line(cmd["put-cell"] " " $5)
    add_line(cmd["put-cell"] " exit")
    next
}
/CODE FORTH IMMEDIATE/ {
    canon[$5] = $4
    next
}
/CODE FORTH/ {
    canon[$4] = $3
    next
}
/DECLARE IMMEDIATE/ {
    imm[getcanon($3)] = 1
    next
}
/CODE START/ {cs=1; next}
/^MACRO/ {
    n = $2
    $1 = ""
    $2 = ""
    cmd[n] = $0
    next
}
!cs {add_line($0); next}
/CODE END/ {cs=0; next}
{compile()}
