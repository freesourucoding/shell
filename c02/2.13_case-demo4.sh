#!/bin/bash

read -p "请输入任意字符:" key
case $key in
[a-z])
  echo "输入小写字母";;
[A-Z])
  echo "输入大小字母";;
[0-9])
  echo "输入数字";;
*)
  echo "输入其他符号";;
esac
