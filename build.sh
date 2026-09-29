#!/bin/bash

set -e
set -o pipefail
shopt -s lastpipe

function find_in() {
    x=$(find $(
        echo "$profile" |
        awk -v OFS=/ -F/ '{for(i=NF;i>0;--i){print $0;$(i)="."}}') \
        -maxdepth 1 -name "$1" | head -n1)
    if [[ "$x" = "" ]] then
        echo $2 "not found" >&2
        return 1
    fi
    echo "$2 -> $x" >&2
    echo $x
}

function code_list() {
    for f in "$@"
    do
        if [[ ${f##*.wf} = ".S" ]] then
            echo $f $(head -n1 $f |
            awk '/native immediate word/{print "imm", $(NF-1);next}{print "reg", $(NF-1)}')
        fi
    done | sort -k2 -k3 -u | awk '{print $1}'
}

function forth_immediates() {
    for f in "$@"
    do
        if [[ ${f##*.wf} = ".fr" ]] then
            head -n1 $f |
            awk '/forth immediate word/{print "DECLARE IMMEDIATE", $(NF)}'
        fi
    done
}

out_name=$1
profile=fragments/$2
sfile=$(mktemp --suffix=.S)
smfile=$(mktemp --suffix=.waf.S)
alt_profile=$(find_in "build.sh" "build.sh" || echo "")
if [[ -n "$alt_profile" ]]
then
    . "$alt_profile"
    exit 0
fi
rc=0
if ! (
echo "// PROFILE  " "$profile"
c_codegen=$(find_in "codegen-c.sh" "codegen-c.sh" || echo "./fragments/no_codegen-c.sh")
c_files=""
exec > $sfile
echo "$profile" | awk -vRS=/ '{if(p=="")p=$1;else p = p "/" $1; print "// search path " p}'
shift
shift
preamble=$(find_in "wforth.S" "wforth.S")
echo "// using preamble $preamble"
cat $preamble
echo ".section .text"
for arg in "$@"
do
    echo "// WORDLIST " "$arg"
    files=$(for c in $(awk '{print $2}' < "lists/$arg.txt")
    do
        find_in "$c.wf.*" "$c" || exit 1
    done)
    for file in $(code_list $files)
    do
       cat $file | grep -v '^//'
    done
    for file in $files
    do
        if [[ ${file##*.wf} = ".c" ]] then
            . $c_codegen
            c_files="$c_files $file"
        fi
    done
done
echo ".section .data.mem"
echo "MEM START"
for arg in "$@"
do
    echo "// WORDLIST " "$arg"
    files=$(for c in $(awk '{print $2}' < "lists/$arg.txt")
    do
        find_in "$c.wf.*" "$c" || exit 1
    done)
    for file in $files
    do
        if [[ ${file##*.wf} = ".S" ]] then
            head -n1 $file | awk -v CN=$(basename ${file%%.wf.*}) '/native immediate word/{print "CODE NATIVE IMMEDIATE", $6, $5, CN;next}/native word/{print "CODE NATIVE", $5, $4, CN}'
        elif [[ ${file##*.wf} = ".fr" ]] then
            head -n1 $file | awk -v CN=$(basename ${file%%.wf.*}) '/forth immediate word/{print "CODE FORTH IMMEDIATE", CN, $5;next}/forth word/{print "CODE FORTH", CN, $4}'
        elif [[ ${file##*.wf} = ".c" ]] then
            head -n1 $file | awk -v CN=$(basename ${file%%.wf.*}) '/native c immediate word/{print "CODE NATIVE IMMEDIATE", $7, ".wrap_" $6, CN;next}/native c word/{print "CODE NATIVE", $6, ".wrap_" $5, CN}'
        fi
    done
    forth_immediates $files
done
echo "CODE START"
for arg in "$@"
do
    echo "\ WORDLIST " "$arg"
    files=$(for c in $(awk '{print $2}' < "lists/$arg.txt")
    do
        find_in "$c.wf.*" "$c" || exit 1
    done)
    for file in $files
    do
        if [[ ${file##*.wf} = ".fr" ]] then
            cat $file
        fi
    done
done
echo "CODE END"
echo "MEM END"
awk -f wforth.awk $sfile > $smfile || exit 1
echo $CC $CFLAGS -o $out_name $smfile $c_files >&2
$CC $CFLAGS -o $out_name $smfile $c_files >&2
); then rc=1; fi
echo rm -vf $sfile $smfile >&2
rm -vf $sfile $smfile >&2
exit $rc
