!#/bin/bash

url=http://192.168.4.5/index.html
date=$(date +"%Y-%m-%d %H:%M:%S")
status_code=$(curl -m 3 -s -o /dev/null -w %{http_code} $url)
# -m:设置超时时间
# -s：设置静默时间
# -o：下载后另存为
# -w:返回http状态码
mail_to="root@localhost"
mail_subject="http_warning"

if [ $status_code -ne 200 ];then
  mail -s $mail_subject $mail_to <<- EOF
  检查时间：$data
  $url页面异常，服务器返回状态码：${status_code}
  EOF
else
  cat >> /var/log/http_check.log <<- EOF
  $date "$url 访问正常"
  EOF
fi