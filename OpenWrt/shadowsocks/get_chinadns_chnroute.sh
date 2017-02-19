#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < get_chinadns_chnroute.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/17 >
#   > Description:      ShadowSocks - Access Control - Bypassed IP List - chinadns_chnroute.txt
#################################################################
cp /etc/chinadns_chnroute.txt /etc/chinadns_chnroute.txt.old
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /etc/chinadns_chnroute.txt
/etc/init.d/shadowsocks restart
