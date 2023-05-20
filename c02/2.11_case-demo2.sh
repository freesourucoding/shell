#!/bin/bash

read -p "请输入1个a-c之间的字母：" key

case $key in
a)
  echo "I am a.";;&   # 使用;;&会继续对后面的模式进行匹配。所以屏幕会继续显示后面的I am aa.
b)
  echo "I am b.";;

a)
  echo "I am aa.";&   # 使用;&会执行后一个模式匹配的命令，所以屏幕会继续显示I am c.
c)
  echo "I am c.";;

a)
  echo "I am aaa.";;
*)
  echo "Out of range.";;
esac
