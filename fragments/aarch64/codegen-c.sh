aarch64_args=(x0 x1 x2 x3 x4 x5 x6 x7)
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
    echo "ldr ${aarch64_args[$f]}, [x20], #8"
done
echo "bl $name"
case $arg_out in
    0 ) ;;
    1 ) echo "str x0, [x20, #-8]!" ;;
    * )
        for f in $(seq 0 $(($arg_out-1)))
        do
            echo "adr x1, wforth_c_s$f"
            echo "ldr x0, [x1]"
            echo "str x0, [x20, #-8]!"
        done
esac
echo "b .next"
