#!/bin/bash

clear
num=$[RANDOM%10+1]
read -p "请输入1-10之间的整数：" guess

if [ $guess -eq $num ];then
  echo "猜对了"
elif [ $guess -lt $num ];then
  echo "猜小了"
else
  echo "猜大了"
fi
