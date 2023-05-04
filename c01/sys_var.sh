#!/bin/bash

echo "当前账户是：$USER, 当前账户的UID是：$UID"
echo "当前账户的根目录是：$HOME"
echo "当前工作目录是：$PWD"
echo "返回0-32767的随机数：$RANDOM"
echo "当前脚本的进程号：$$"
echo "当前脚本的名称：$0"
echo "当前脚本的第1个参数：$1"
echo "当前脚本的第2个参数：$2"
echo "当前脚本的第3个参数：$3"
echo "当前脚本的位置参数数量：$#"
echo "当前脚本的所有参数：$*"
echo "准备创建一个文件..."
touch "$*"
echo "准备创建多个文件..."
touch "$@"

ls /etc/passwd
echo "我是正确的返回状态码：$?，因为上一条命令执行结果正确"
ls /etc/pass
echo "我是错误的返回状态码：$?，因为上一条命令执行结果失败"


# 执行./sys_var.sh A C 8 D

