#!/bin/bash

shopt -s extglob
read -p "请输入任意字符：" key

case $key in
+([Yy]))
  echo "输入了至少1个[Yy]";;
?([Nn])o)
  echo "输入的是[Nn]o或仅为o";;
# ([Nn])是一组，和o是并列关系
t*(o))
  echo "输入的是t或to或tooo...";;
@([0-9]))
  echo "输入的是单个数字";;
!([[:punct:]]))
  echo "输入的不是标点符号";;
# [:punct:]是标点符号
*)
  echo "输入的是其他符号";;
esac
