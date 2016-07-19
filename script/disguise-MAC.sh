#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < disguise-MAC.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/07/19 >
#   > Description:
#################################################################

#ETHIF="eth1"
ETHIF="enp1s0"

# disguise MAC address
ifconfig $ETHIF down
ifconfig $ETHIF hw ether "00:01:02:03:04:05"
ifconfig $ETHIF up
