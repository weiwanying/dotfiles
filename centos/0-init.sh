#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < 0-init.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/06/27 >
#   > Description:      CentOS安装后的配置流程
#################################################################
#{{{ 1. network
# CentOS 7 默认安装好之后是没有自动开启网络连接的
# config path: /etc/sysconfig/network-scripts/
# 修改ifcfg-ethxxxx（例如：ifcfg-eth0）
## {{{ dhcp
##    BOOTPROTO=dhcp
##    ONBOOT=yes
## }}}
## {{{ static IP
##    BOOTPROTO=static
##    ONBOOT=yes              #开启自动启用网络连接
##    IPADDR0=192.168.1.100  #设置IP地址
##    PREFIXO0=24             #设置子网掩码
##    GATEWAY0=192.168.1.254   #设置网关
##    DNS1=8.8.8.8            #设置主DNS
##    DNS2=8.8.4.4            #设置备DNS
## }}}
# 重启网络
#service network restart
# 测试网络
#ping www.baidu.com
#}}}
#{{{ 2. hostname
SERVERNAME="SeanServer"
hostname $SERVERNAME
echo "$SERVERNAME" > /etc/hostname
sed -i "s/localhost.localdomain/$SERVERNAME/g" /etc/hosts
#}}}
#{{{ time zone
timedatectl set-timezone Asia/Shanghai
#}}}
