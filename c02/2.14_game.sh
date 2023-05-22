#!/bin/sh

#1：石头；2：剪刀；3：布（随机数对3求模后，在加1的结果是1,2,3）

computer=$[RANDOM%3+1]
clear
echo -e "#\033[32m 请根据下列提示出拳： \033[0m#"
echo "|1.石头   |"
echo "|2.剪刀   |"
echo "|3.布     |"

read -p "请输入1~3的值:" person
clear
case $person in
1)
  if [[ "$computer" == 1 ]];then
    echo "|  出拳：石头  |"
	echo "|计算机出拳：石头|"
	echo -e "\033[32m 平局.\033[0m"
  elif [[ "$computer" == 2 ]];then
    echo "|  出拳：石头  |"
	echo "|计算机出拳：剪刀|"
	echo -e "\033[32m 你赢了.\033[0m"
  elif [[ "$computer" == 3 ]];then
    echo "|  出拳：石头  |"
	echo "|计算机出拳：布|"
	echo -e "\033[32m 你输了.\033[0m"
fi;;
2)
  if [[ "$computer" == 1 ]];then
    echo "|  出拳：剪刀  |"
	echo "|计算机出拳：石头|"
	echo -e "\033[32m 你输了.\033[0m"
  elif [[ "$computer" == 2 ]];then
    echo "|  出拳：剪刀  |"
	echo "|计算机出拳：剪刀|"
	echo -e "\033[32m 平局.\033[0m"
  elif [[ "$computer" == 3 ]];then
    echo "|  出拳：剪刀  |"
	echo "|计算机出拳：布|"
	echo -e "\033[32m 你赢了.\033[0m"
fi;;
3)
  if [[ "$computer" == 1 ]];then
    echo "|  出拳：布  |"
	echo "|计算机出拳：石头|"
	echo -e "\033[32m 你赢了.\033[0m"
  elif [[ "$computer" == 2 ]];then
    echo "|  出拳：布  |"
	echo "|计算机出拳：剪刀|"
	echo -e "\033[32m 你输了.\033[0m"
  elif [[ "$computer" == 3 ]];then
    echo "|  出拳：布  |"
	echo "|计算机出拳：布|"
	echo -e "\033[32m 平局.\033[0m"
fi;;
*)
  echo -e "\033[91m 无效输入，请输入1~3的值\033[0m";;
esac
