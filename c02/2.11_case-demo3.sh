#!/bin/bash

read -p "你确定需要执行该操作吗(y|n)" key
case $key in
[Yy]|[Yy][Ee][Ss])
  echo "注意：你选择的是yes";;
[Nn]|[Nn][Oo])
  echo "你选择的是no";;
*)
  echo "无效输入";;
esac
