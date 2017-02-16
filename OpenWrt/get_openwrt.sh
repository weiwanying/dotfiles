#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < get_openwrt.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/08 >
#   > Description:
#################################################################
wget "https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/openwrt-15.05.1-ar71xx-generic-tl-wr703n-v1-squashfs-factory.bin"
wget "https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/md5sums"

md5 *.bin
cat md5sums | grep wr703n
