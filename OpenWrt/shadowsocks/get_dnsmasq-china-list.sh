#!/bin/sh
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < get_dnsmasq-china-list.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/17 >
#   > Description:      https://github.com/felixonmars/dnsmasq-china-list
#################################################################

mkdir -p /etc/dnsmasq.d/ && mv /etc/dnsmasq.d/
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
wget --no-check-certificate https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
wget --no-check-certificate https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/bogus-nxdomain.china.conf
wget --no-check-certificate https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/google.china.conf
/etc/init.d/dnsmasq restart
