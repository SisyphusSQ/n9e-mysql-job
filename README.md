# 排查slow-log
在n9e中执行```checkSlowLog.sh```，然后观察哪些库和表需要知道它们的表结构和索引结构。

再执行```checkTbStruc.sh```，两个参数```DB```、```table```。

# 排查死锁
直接执行```deadLock.sh```的内容就可以了。

其中看错误日志中的死锁情况，需要把```innodb-print-all-deadlocks```打开
```
set global innodb_print_all_deadlocks = 1;
```
