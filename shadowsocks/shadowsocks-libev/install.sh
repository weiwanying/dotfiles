#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < install.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/17 >
#   > Description:      https://doub.io/ss-jc5/
#################################################################
# CentOS
wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev.sh
chmod +x shadowsocks-libev.sh
./shadowsocks-libev.sh 2>&1 | tee shadowsocks-libev.log
#./shadowsocks-libev.sh uninstall

# Debian/Ubuntu
wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev-debian.sh
chmod +x shadowsocks-libev-debian.sh
./shadowsocks-libev-debian.sh 2>&1 | tee shadowsocks-libev-debian.log
#./shadowsocks-libev-debian.sh uninstall

#config: /etc/shadowsocks-libev/config.json
#启动：/etc/init.d/shadowsocks start
#停止：/etc/init.d/shadowsocks stop
#重启：/etc/init.d/shadowsocks restart
#查看状态：/etc/init.d/shadowsocks status
