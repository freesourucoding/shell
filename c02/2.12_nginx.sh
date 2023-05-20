#!/bin/bash

nginx="/usr/local/nginx/sbin/nginx"
pidfile="/usr/local/nginx/logs/nginx.pid"

case $1 in
start)
  if [ -f $pidfile ];then
    echo -e "\033[91mNginx is already running...\033[0m"
	exit
  else
    $nginx && echo -e "\033[32mNginx is already running...\033[0m"
  fi;;
stop)
  if [ ! -f $pidfile ];then
    echo -e "\033[91mNginx is already stopped.\033[0m"
	exit
  else
    $nginx -s stop && echo -e "\033[32mNginx is stopped.\033[0m"
  fi;;
restart)
  if [ ! -f $pidfile ];then
    echo -e "\033[91mNginx is already stopped.\033[0m"
	echo -e "\033[91mPlease to run Nginx first.\033[0m"
	exit
  else 
    $nginx -s stop && echo -e "\033[32mNginx is stopped.\033[0m"
  fi
  $nginx && echo -e "\033[32mNginx is running...\033[0m"
  ;;
status)
  if [ -f $pidfile ];then
    echo -e "\033[32mNginx is running...\033[0m"
  else
    echo -e "\033[32mNginx is stopped.\033[0m"
  fi;;
reload)
  if [ ! -f $pidfile ];then
    echo -e "\033[91mNginx is already stopped.\033[0m"
	exit
  else
    $nginx -s reload && echo -e "\033[32mReload configure done.\033[0m"
  fi;;
*)
  echo "usage:$0 {start | stop | restart | status | reload}";;
esac
# 后面的start | stop ...赋值给$1