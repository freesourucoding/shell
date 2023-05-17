#!/bin/bash

mem_free=$(grep Available /proc/meminfo | egrep -o "[0-9]+")
[ $mem_free -le 512000 ] && echo Y || echo N

# 测试可用的内存是否小于512M

+++++++++++++++++++++++++++++++++++++

procs=$(ps aux | wc -l)
[ $procs -gt 100 ] && echo Y || echo N

# 测试系统中正在运行的进程数是否大于100

++++++++++++++++++++++++++++++++++++++

num=$(cat /etc/passwd | wc -l)
[ $num -ge 30 ] && echo Y || echo N

# 测试当前系统账户是否大于或等于30个
