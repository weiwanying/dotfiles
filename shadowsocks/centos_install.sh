#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < centos_install.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/09/13 >
#   > Description:    CentOS install shadowsocks
#                     http://seanxp.com/2016/shadowsocks/
#################################################################

yum install python-setuptools && easy_install pip
pip install shadowsocks
cp shadowsocks.json /etc/shadowsocks.json
# 使用配置文件登录
# ssserver -c /etc/shadowsocks.json

# Usage - 非配置文件登录
# ssserver -p 443 -k password -m aes-256-cfb
# ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start
# ssserver -d stop
# less /var/log/shadowsocks.log
