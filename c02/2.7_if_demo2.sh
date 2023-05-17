#!/bin/bash

# 测试计算机的cpu是amd还是intel

if grep -q AMD /proc/cpuinfo; then
   echo "AMD cpu"
fi

if grep -q Intel /proc/cpuinfo; then
   echo "Intel cpu"
fi