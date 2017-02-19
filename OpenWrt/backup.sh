#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < backup.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/08 >
#   > Description:
#################################################################

Router=$1

ssh $Router "cat /proc/mtd"
ssh $Router "dd if=/dev/mtd0 of=/tmp/u-boot.bin"
ssh $Router "dd if=/dev/mtd4 of=/tmp/art.bin"
mkdir -p backup/
scp $Router:/tmp/u-boot.bin backup/u-boot.bin
scp $Router:/tmp/art.bin backup/art.bin
ssh $Router "rm /tmp/u-boot.bin /tmp/art.bin"
ls -l backup/
