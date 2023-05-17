!#/bin/bash

url="http://192.168.4.5/index.html"
date=$(date +"%Y-%m-%d %H:%M:%S")

source_hash="e3eb0a1df437f3f97a64aca5952c8ea0"
url_hash=$(curl -s $url | md5sum | cut -d ' ' -f1)
#-s：静默模式

if [ "$url_hash" != "$source_hash" ];then
  mail -s http_warning root@localhost <<- EOF
    检测时间：$date
	数据完成性校验失败,$url, 页面数据被篡改
	EOF
else
  cat >> /var/log/http_check.log <<- EOF
  $date "$url，数据完成性校验正常"
  EOF
fi
