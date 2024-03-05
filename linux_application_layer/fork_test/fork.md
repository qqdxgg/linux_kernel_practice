## 下面两种写法运行结果为什么不一样
```c
int main()
{
    pid_t a_pid, b_pid;
    a_pid = fork();
    if (a_pid < 0)
        printf("error!");
    else
    {
        if (a_pid == 0)
        {
            printf("b\n");
        }
        else if (a_pid > 0)
            printf("a\n");
    }

    if (b_pid = fork() < 0)
        printf("error!");
    else
    {
        printf("b_pid: %u\n", b_pid);
        if (b_pid == 0)
        {
            printf("c\n");
        }
        else if (b_pid > 0)
            printf("e\n");
    }

    return 0;
}
```
```c
int main()
{
    pid_t a_pid, b_pid;
    a_pid = fork();
    if (a_pid < 0)
        printf("error!");
    else
    {
        if (a_pid == 0)
        {
            printf("b\n");
        }
        else if (a_pid > 0)
            printf("a\n");
    }

    b_pid = fork();

    printf("b_pid: %u\n", b_pid);
    if (b_pid == 0)
    {
        printf("c\n");
    }
    else if (b_pid > 0)
        printf("e\n");

    return 0;
}
```
```
这两种写法的运行结果会有所不同，因为它们在 fork() 调用的处理方式上存在差异。

在第一个版本中，if (b_pid = fork() < 0) 这行代码存在一个问题，因为 < 操作符的优先级高于 =，所以实际上这行代码相当于 if (b_pid = (fork() < 0))。这会导致 b_pid 被赋值为 0 或 1，而不是 fork() 返回的子进程的 PID。这可能导致 b_pid 的值不准确。

而在第二个版本中，b_pid = fork(); 和 printf("b_pid: %u\n", b_pid); 是连续的两条语句，它们都会在 if-else 结构外面执行。因此，无论 fork() 是否成功，b_pid 都会被正确地赋值为子进程的 PID，因此输出的 b_pid 是正确的。

因此，第一个版本中 b_pid 的值可能不正确，而第二个版本中 b_pid 的值是正确的。这就是这两种写法运行结果不一样的原因。
```
