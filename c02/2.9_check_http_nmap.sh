!#/bin/bash

ip=192.168.4.254

nmap -n -sS -p80 192.168.4.254 | grep -q "^80/tcp open"
# -n: 禁止反向dns
# -sS: 针对tcp的半开扫描
# -p80: 扫描80端口
 

if [ $? -eq 0 ];then
  echo "http service is running on $ip"
else
  echo "http service is stopped on $ip"
fi
