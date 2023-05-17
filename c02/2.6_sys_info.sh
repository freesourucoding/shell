#!/bin/bash

# 变量定义如下：
# time:时间, localip:网卡IP, free_mem:剩余内存大小, free_disk:剩余磁盘大小
# cpu_load:15min平均负载, login_user:登录系统的用户, procs:当前进程数量

local_time=$(date +"%Y%m%d %H:%M:%S")
local_ip=$(ifconfig eth0 | grep netmask | tr -s " " | cut -d" " -f3)
free_mem=$(cat /proc/meminfo | grep Avai | tr -s " " | cut -d" " -f2)
free_disk=$(df | grep "/$" | tr -s " " | cut -d' ' -f4)
cpu_load=$(cat /proc/loadavg | cut -d' ' -f3)
login_user=$(who | wc -l)
procs=$(ps aux | wc -l)

# vmstat命令查看系统中cpu的中断数，上下文切换数量
# cpu处于I/O等待的时间，用户态及系统态消耗cpu的统计数据
# vmstat命令输出的前2行信息是头部信息，第三行信息是开机到现在的平均数据
# irq:中断，cs：上下文切换，usertime：用户态
# cpu, system：系统态cpu，iowait：等待I/O时间

irq=$(vmstat 1 2 | tail -n +4 | tr -s ' ' | cut -d' ' -f12)
cs=$(vmstat 1 2 | tail -n +4 | tr -s ' ' | cut -d' ' -f13)
usertime=$(vmstat 1 2 | tail -n +4 | tr -s ' ' | cut -d ' ' -f14)
systime=$(vmstat 1 2 | tail -n +4 | tr -s ' ' | cut -d' ' -f15)
iowait=$(vmstat 1 2 | tail -n +4 | tr -s ' ' | cut -d ' ' -f17)

# 开始判断

# 当剩余内存不足1GB发送邮件给root进行报警
[ $free_mem -lt 1048576 ] && \
echo "$local_time Free memory no enough. Free_mem:$free_mem on $local_ip" | mail -s Warning root@localhost

# 当剩余磁盘不足10GB发送邮件给root进行报警
[ $free_disk -lot 10485760 ] && \
echo "$local_time Free disk not enough. root_free_disk:$free_disk on $local_ip" | mail -s Warning root@localhost

# 当cpu的15min平均负载超过4时发送邮件给root进行报警
result=$(echo "$cpu_load > 4" | bc)
[ $result -eq 1 ] && \
echo "$local_time CPU load to high
cpu 15 averageload:$cpu_load on $local_ip" | \ 
mail -s Warning root@localhost

# 当系统实时在线用户超过3人发送邮件给root进行报警
[ $login_user -gt 3 ] && \
echo "$local_time Too many user.
$login_user users login to $local_ip" | \
mail -s Warning root@localhost

# 当实时进程数量大于500时发送邮件给root进行报警
[ $procs -gt 500] && \
echo "$local_time Too many procs.
$procs proc are running on $local_ip" | \
mail -s Warning root@localhost

# 当实时cpu中断数量大于500时发送邮件给root进行报警
[ $irq -gt 5000 ] && \
echo "$local_time Too many interupts.
There are $irq interupts on $local_ip" | \
mail -s Warning root@localhost

# 当实时cpu上下文切换数量大于5000是发送邮件告警
[ $cs -gt 5000 ] && \
echo "$local_time Too many content switches.
$cs of context switches per second on $local_ip" | \
mail -s Warning root@localhost

# 当用户态进程占用cpu超过70%发送邮件告警
[ $usertime -gt 70 ] && \
echo "$local_time cpu load to high.
Time spend runnning non-kernel code:$usertime on $local_ip" | \
mail -s Warning root@localhost

# 当内核态进程占用cpu超70%发送告警邮件
[ $systime -gt 70 ] && \
echo "$local_time cpu load to high.
Time spend running non-kernel code:$systime on $local_ip" | \
mail -s Warning root@localhost

# 当cpu消耗大量时间等待磁盘I/O时发送告警邮件
[ $iowait -gt 40 ] && \
echo "$local_time disk to slow.
cpu spend too many time wait disk I/O:$iowait on $local_ip" | \
mail -s Warning root@localhost