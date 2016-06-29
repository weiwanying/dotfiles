#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#	> File Name:        < iptables.rule >
#	> Author:           < Sean Guo >
#	> Mail:             < iseanxp+code@gmail.com >
#	> Created Time:     < 2016/01/22 >
#	> Description:      firewall - iptables
#	                    1. iptables.rule, 基本规则
#	                    2. iptables.deny
#	                    3. iptables.allow
#     参考: <鸟哥的Linux私房菜> - 服务器架设篇 - 第九章
#################################################################
#{{{ 具体机器相关
# 外网, Public IP
EXTIF="eth1"
EXTIP="1.2.3.4"

# 内网, LAN; 无内网则为空
INIF="eth2"
#INIF=""

# 内网网络
INNET="192.168.1.0/24"
#INNET=""
export EXINF  INIF  INNET EXTIP
#}}}

#{{{ 本机相关 - iptables - filter
# 0. 配置内核的相关网络功能
#   启动SYN Cookie, 主机在发送SYN/ACK确认数据包前，要求Client端在短时间内回复一个序号（包含原SYN数据包信息），以防止SYN Flooding 攻击;
#echo "1" > /proc/sys/net/ipv4/tcp_syncookies

#   忽略ICMP广播包, 防止ping flooding攻击;
#echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

#   conf/目录里的每一个目录，对应一个接口(eth0,eth1,...);
#     rp_filter, 逆向路径过滤(Reverse Path Filtering), 分析数据报来源地址
#     log_martians, 启动记录不合法的IP来源
#for i in /proc/sys/net/ipv4/conf/*/{rp_filter,log_martians}; do
#  echo "1" > $i
#done

#for i in /proc/sys/net/ipv4/conf/*/{accept_source_route,accept_redirects,send_redirects}; do
#echo "0" > $i
#  done

# 1. 清除原有的iptables-filter规则, 重新配置; 以下命令需要ROOT权限
#   '-F', deleting all the rules one by one.
iptables -t filter -F
#   '-X', Delete the optional user-defined chain specified.
iptables -t filter -X
#   '-Z', Zero the packet and byte counters in all chains, or only the given chain, or only the given rule in a chain.
iptables -t filter -Z

# 2. 设置默认策略(Public Policy)
#   '-P', Set the policy for the chain to the given target.
# 将INPUT的默认策略设为DROP为安全的策略, 不过需要更多的规则设定允许进入的数据包;
#iptables -t filter -P INPUT   DROP
iptables -t filter -P INPUT   ACCEPT
iptables -t filter -P OUTPUT  ACCEPT
iptables -t filter -P FORWARD ACCEPT

# 3. 信任本机环路(Local Loopback)
#   指定数据包进入的接口　-i 或 --in-interface
#   指定数据包送出的接口　-o 或 --out-interface
#   INPUT规则表中只允许指定-i接口，OUTPUT规则表中只允许指定-o接口，FORWARD表可以指定这两种接口
# 要进入lo的数据包, 全都接受
iptables -t filter -A INPUT -i lo -j ACCEPT

# 4. 信任相关状态的数据包(RELATED, ESTABLISHED)
#   '--state', 数据报的状态;
#       'INVALID',        无效数据包;
#       'ESTABLISHED',    已经连接成功的连接状态;
#       'NEW',            新建立的连接状态;
#       'RELATED',        与主机发出的数据报相关;
iptables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# 5. 启动额外的防火墙 script 模块(自定义)
#if [ -f /usr/local/virus/iptables/iptables.deny ]; then
#  sh /usr/local/virus/iptables/iptables.deny
#fi
#if [ -f /usr/local/virus/iptables/iptables.allow ]; then
#  sh /usr/local/virus/iptables/iptables.allow
#fi
#if [ -f /usr/local/virus/httpd-err/iptables.http ]; then
#  sh /usr/local/virus/httpd-err/iptables.http
#fi

# 6. 允许某些类型的 ICMP 封包进入
#    取消ICMP-Type 8, 防止Ping;
#AICMP="0 3 3/4 4 11 12 14 16 18"
#for tyicmp in $AICMP
#do
#  iptables -A INPUT -i $EXTIF -p icmp --icmp-type $tyicmp -j ACCEPT
#done

# 7. 允许某些服务的进入，请依照你自己的环境开启
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport  21 --sport 1024:65534 -j ACCEPT # FTP
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport  22 --sport 1024:65534 -j ACCEPT # SSH
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport  25 --sport 1024:65534 -j ACCEPT # SMTP
# iptables -t filter -A INPUT -p UDP -i $EXTIF --dport  53 --sport 1024:65534 -j ACCEPT # DNS
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport  53 --sport 1024:65534 -j ACCEPT # DNS
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport  80 --sport 1024:65534 -j ACCEPT # WWW
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport 110 --sport 1024:65534 -j ACCEPT # POP3
# iptables -t filter -A INPUT -p TCP -i $EXTIF --dport 443 --sport 1024:65534 -j ACCEPT # HTTPS
#}}}

#{{{ 后端主机的防火墙设定 - iptables - nat
# 1. 先加载一些有用的模块
#modules="ip_tables iptable_nat ip_nat_ftp ip_nat_irc ip_conntrack ip_conntrack_ftp ip_conntrack_irc"

#for mod in $modules
#do
#  testmod=`lsmod | grep "^${mod}" | awk '{print $1}'`
#  if [ "$testmod" == "" ]; then
#    modprobe $mod
#  fi
#done

# 2. 清除 NAT table 的规则
iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z

iptables -t nat -P PREROUTING  ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT      ACCEPT

# 3. 若有内部接口的存在 (双网卡) 开放成为路由器，且为 IP 分享器！
if [ "$INIF" != "" ]; then
  # 信任内部接口
  iptables -A INPUT -i $INIF -j ACCEPT
  # 打开IP转发功能, 应该在创建所有防火墙的规则之后再打开IP转发功能
  echo "1" > /proc/sys/net/ipv4/ip_forward
  if [ "$INNET" != "" ]; then
    for innet in $INNET
    do
      # NAT POSTROUTING 修改数据包报头的源IP - SNAT(Source Network Address Translation)
      # 所有源地址为内网, 要从外网接口出去的数据包，都要伪装源IP为Public IP;
      iptables -t nat -A POSTROUTING -s $innet -o $EXTIF -j MASQUERADE
    done
  fi
fi

# 如果你的 MSN 一直无法联机，或者是某些网站 OK 某些网站不 OK，
# 可能是 MTU 的问题，那你可以将底下这一行给他取消批注来启动 MTU 限制范围
# iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -m tcpmss --mss 1400:1536 -j TCPMSS --clamp-mss-to-pmtu

# 4. NAT 服务器后端的LAN 内对外部服务器设定
#   NAT PREROUTING 修改数据包报头的目标IP - DNAT(Destination Network Address Translation)
#   来自外网接口, 目标端口为映射端口的数据包, 将其目标IP修改为LAN内的服务器IP; Public_IP:9091 -> Private_IP:9091, transmission web interface;
iptables -t nat -A PREROUTING -i $EXTIF -p tcp --dport 9091 -j DNAT --to-destination 192.168.1.100:9091 # transmission web
#   注意: 局域网内访问Public IP, 与外网访问Public IP的效果不同; 上条规则只适用于外网IP访问Public IP;
#   下条规则，不指定网络接口，而是指定目标IP，则无论内外网，只要访问Public IP，就可以端口映射;
iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 9091 -j DNAT --to-destination 192.168.1.100:9091

iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 3690 -j DNAT --to-destination 192.168.1.100:3690       # svn
iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 7777 -j DNAT --to-destination 192.168.1.100:22         # ssh

# 5. 特殊的功能，包括 Windows 远程桌面所产生的规则，假设桌面主机IP为 1.2.3.4
# iptables -t nat -A PREROUTING -p tcp -s 1.2.3.4 --dport 6000 -j DNAT --to-destination 192.168.1.10
# iptables -t nat -A PREROUTING -p tcp -s 1.2.3.4 --sport 3389 -j DNAT --to-destination 192.168.1.20
#}}}

#{{{ 储存iptables设定
# /etc/init.d/iptables is no longer used.
#/etc/init.d/iptables save

# 将此脚本添加至开机启动/ect/rc.local中，每次开机重新配置一遍。
#}}}
