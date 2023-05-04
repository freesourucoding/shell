#!/bin/bash
#Read User's name and password from standard input.

read -p "请输入用户名：" USER
read -s -p "请输入密码：" PASS
useradd "$USER"
echo "$PASS" | passwd --stdin "$USER"
