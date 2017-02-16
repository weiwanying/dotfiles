#!/bin/sh
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < opkg.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/07 >
#   > Description:
#################################################################

opkg update

# wireless tool
opkg install iwinfo
opkg install rsync
