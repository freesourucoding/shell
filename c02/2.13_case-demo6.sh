#!/bin/bash

shopt -s extglob
read -p "请输入任意字符：" key

case $key in
+([[:lower:]]))
  echo "输入的是小写字母";;
+([[:upper:]]))
  echo "输入的是大写字母";;
+([0-9]))
  echo "输入的是数字";;
*)
  echo "输入的是其他特殊字符";;
esac

