./cmd.sh cat /proc/test_dir/test_rw
cat /sys/kernel/debug/tracing/trace > 1
./stack.sh cat /proc/test_dir/test_rw 
cat /sys/kernel/debug/tracing/trace > 2

Note: ubuntu16.4 delay long long time. ubuntu22.4 not delay so long.
