#!/bin/bash

localip=$(ifconfig ens33 | grep netmask | tr -s " " | cut -d" " -f3)
mem=$(free | grep Mem | tr -s " " | cut -d" " -f7)
cpu=$(uptime | tr -s " " | cut -d" " -f13)
echo "本机IP地址是：$localip"
echo "本机内存剩余容量为：$mem"
echo "本机CPU 15min的平均负载为：$cpu"
