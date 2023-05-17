#!/bin/bash

#定义不同颜色的属性

setcolor_failure="echo -en \\033[91m"
setcolor_success="echo -en \\033[32m"
setcolor_normal="echo -e \\033[0m"

#判断是否以管理员身份执行脚本
if [[[ $UID -ne 0 ]];then
  $setcolor_failure
  echo -n "请以管理员身份运行脚本"
  $setcolor_normal
  exit
fi

#判断系统是否存在wget工具
if rpm --quiet -q wget;then
  wget -c http://nginx.org/download/nginx-1.14.0.tar.gz
else
  $setcolor_failure
  echo -n "未找到wget，请先安装"
  $setcolor_normal
  exit
fi

#如果没有nginx账户，自动创建该账户
if ! id nginx &>/dev/null;then
  adduser -s /sbin/nologin nginx
fi

#测试是否存在正确的源码包软件
if [[ ! -f nginx-1.14.0.tar.gz ]];then
  $setcolor_failure
  echo -n "未找到nginx源码包，请先下载"
  $setcolor_normal
  exit
else
  yum install -y gcc pcre-devel zlib-devel openssl-devel
  clear
  $setcolor_success
  echo -n "安装nignx源码包"
  $setcolor_normal
  sleep 6
  tar -xf nginx-1.14.0.tar.gz
  
  cd nginx-1.14.0/
  ./configure \
  --user=nginx \
  --group=nginx \
  --prefix=/data/server/nginx \
  --with-stream \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --without-http_autoindex_module \
  --without-http_ssi_module
  make
  make install
fi
if [[ -x /data/server/nginx/sbin/nginx ]];then
  clear
  $setcolor_success
  echo -n "一键部署完成"
  $setcolor_normal
fi