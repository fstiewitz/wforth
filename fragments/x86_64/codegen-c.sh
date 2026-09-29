x86_64_args=(%rdi %rsi %rdx %rcx %r8 %r9)
head -n1 $file |
    awk -v CN=$(basename ${file%%.wf.*}) '/native c immediate word/{print $6, $8, $9;next}/native c word/{print $5, $7, $8}' |
    read name arg_in arg_out
if [[ -z $name ]]
then
    echo "could not parse header from $file" >&2
    exit 1
fi
echo ".wrap_$name:"
for f in $(seq $(($arg_in-1)) -1 0)
do
    echo "pop ${x86_64_args[$f]}"
done
echo "call $name"
case $arg_out in
    0 ) ;;
    1 ) echo "push %rax" ;;
    * )
        for f in $(seq 0 $(($arg_out-1)))
        do
            echo "movq wforth_c_s$f(%rip), %rax"
            echo "push %rax"
        done
esac
echo "jmp .next"
