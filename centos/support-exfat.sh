#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < support-exfat.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/17 >
#   > Description:      CentOS support exfat
#                       http://www.itdadao.com/articles/c15a458668p0.html
#################################################################

# 1. EPEL(Extra Packages for Enterprise Linux)
# EPEL 是由Fedora社区创建和维护的第三方软件源，含有大量涉及网络、系统管理、程序开发和系统监控等内容的高质量的开源软件包，对于RHEL及其兼容的Linux发行版如CentOS的官方源来说是个很好的补充。
# Nux Dextop 库依赖于 EPEL 库
yum -y install epel-release

# 2. Nux Dextop，Nux.Ro RPMs for general desktop use
# A desktop and multimedia oriented RPM repository for EL. It contains a lot of graphical programs such as Ardour, but also text based apps line Cone.
uname -a | grep 'el6' && rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm
uname -a | grep 'el7' && rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
# disable Nux Dextop
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/nux-dextop.repo

# 3. fuse-exfat, https://github.com/relan/exfat
# This project aims to provide a full-featured exFAT file system implementation for Unix-like systems.
# It consists of a FUSE module (fuse-exfat) and a set of utilities (exfat-utils).
yum --enablerepo=nux-dextop  install fuse-exfat exfat-utils

# 4. mount a exfat partition
# mount -t exfat /dev/sdb1 /mnt
