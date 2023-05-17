#!/bin/bash

#服务器状态监控

if [ -z $1 ];then
   echo "错误：未输入服务名称"
   echo "用法：脚本名 服务名"
   exit
if

if systemctl is-active $1 &> /dev/null; then
   echo "$1 已经启动"
else
   echo "$1 未启动"
fi

if systemctl is-enabled $1 &>/dev/null; then
   echo "$1是开机自启动"
else
   echo "$1不是开机自启动"
fi
