#!/bin/bash

#脚本配置的vnc服务器，客户端无须验证密码既可以连接
#客户端仅有查看权限，没有鼠标和键盘操作权限

rpm --quiet -q tigervnc-server
if [ $? -ne 0 ];then
   yum -y install tigervnc-server
fi
x0vncserver AcceptKeyEvents=0 AcceptPointerEvents=0 \
AlwaysShared=1 SecurityTypes=None rfbport=5908