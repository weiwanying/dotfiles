#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < 1-install.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/17 >
#   > Description:
#################################################################
#{{{ install software
yum -y install epel-release
yum -y update
yum -y install vim zsh git tmux wget curl subversion

yum -y install python-pip
#curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py
pip install --upgrade pip

#yum -y install httpd vsftpd
#yum -y install mariadb mariadb-server
## {{{mentohust
# Google Code( https://code.google.com/archive/p/mentohust/downloads )
#wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mentohust/mentohust-0.3.4-2.el6.x86_64.rpm
#rpm -i mentohust-0.3.4-2.el6.x86_64.rpm
## }}}
#}}}
