#!/bin/bash
debugfs=/sys/kernel/debug
echo nop > $debugfs/tracing/current_tracer
echo 0 > $debugfs/tracing/tracing_on
echo $$ > $debugfs/tracing/set_ftrace_pid
echo function > $debugfs/tracing/current_tracer
echo test_proc_show > $debugfs/tracing/set_ftrace_filter
echo 1 > $debugfs/tracing/options/func_stack_trace
echo 1 > $debugfs/tracing/tracing_on
exec "$@"
