# this script is included into build.sh whenever a wrapper
# around a c function needs to be generated (i.e.
#   printed to standard output).
# the label name of the wrapper is '.wrap_CNAME'.
# 'CNAME' is extracted from the file's header.
#
# arguments are extracted and inserted like
#   arg0 arg1 ... argn -- result0 result1 ... resultn
#
# variable $file: file path to c file
# (you have access to all variables in build.sh because
#  this file is included, not called)
#
# header line in $file:
#   // native c word CNAME FORTH_NAME ARGCOUNT RESULTCOUNT
# or:
#   // native c immediate word CNAME FORTH_NAME ARGCOUNT RESULTCOUNT
riscv_args=(a0 a1 a2 a3 a4 a5 a6 a7)
head -n1 $file |
    awk -v CN=$(basename ${file%%.wf.*}) '/native c immediate word/{print $6, $8, $9;next}/native c word/{print $5, $7, $8}' |
    read name arg_in arg_out
if [[ -z $name ]]
then
    echo "could not parse header from $file" >&2
    exit 1
fi
echo ".wrap_$name:"
for f in $(seq 0 $(($arg_in-1)))
do
    echo "ld ${riscv_args[$(($arg_in-1-$f))]}, $(($f*8))(sp)"
done
echo "addi sp, sp, $(($arg_in*8))"
echo "call $name"
case $arg_out in
    0 ) ;;
    1 )
        echo "sd a0, -8(sp)"
        echo "addi sp, sp, -8"
        ;;
    * )
        for f in $(seq 0 $(($arg_out-1)))
        do
            echo "ld a0, wforth_c_s$f"
            echo "sd a0, $((-$f*8-8))(sp)"
        done
        echo "addi sp, sp, -$(($arg_out*8))"
esac
echo "j .next"
