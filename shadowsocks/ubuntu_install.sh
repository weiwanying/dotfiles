#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < ubuntu_install.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/09/13 >
#   > Description:
#################################################################

apt-get install python-pip
pip install shadowsocks
cp shadowsocks.json /etc/shadowsocks.json
# ssserver -c /etc/shadowsocks.json
