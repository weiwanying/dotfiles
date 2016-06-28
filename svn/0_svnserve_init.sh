#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < svnserve_init.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/06/27 >
#   > Description:      搭建SVN服务器，创建svn账户并启动服务
#
#     SVN Serve Path: /opt/svn/
#     linux user    : svn (no password)
#################################################################

SVN_ROOT="/opt/svn"
SVN_DEMO="$SVN_ROOT/demo"
SH_ROOT=`pwd`

# 创建SVN根目录
mkdir -p $SVN_ROOT
# 创建一个demo项目仓库
mkdir -p $SVN_DEMO
svnadmin create $SVN_DEMO

# 配置SVN
cd "$SVN_DEMO/conf"
# 配置SVN - svnserve.conf
sed -i "/anon-access = read/ a anon-access = none" svnserve.conf
sed -i "/auth-access = write/ a auth-access = write" svnserve.conf
sed -i "/password-db = passwd/ a password-db = passwd" svnserve.conf
sed -i "/authz-db = authz/ a authz-db = authz" svnserve.conf
sed -i "/realm = My First Repository/ a realm = `echo -n $HOSTNAME` SVN Server" svnserve.conf
# 配置SVN - passwd
sed -i "$ a # Configure demo, NOT SAFE by using weak password! " passwd
sed -i "$ a $USER = $USER@123" passwd
# 配置SVN - authz
sed -i "$ a # Configure demo " authz
sed -i "$ a [demo:/]" authz
sed -i "$ a $USER = rw" authz

# 创建svn账户，且不配置密码（不可登录），仅用于运行svnserve服务
# -s /sbin/nologin
useradd -c "svn user" -d $SVN_ROOT -M svn
usermod -a -G apache svn
chown -R svn:apache $SVN_ROOT

# 为SVN服务器添加HTTP支持
if [ -f "$SH_ROOT/PtoWP.pl" ];then
  cp "$SH_ROOT/PtoWP.pl" "$SVN_DEMO/conf"
  perl "$SVN_DEMO/conf/PtoWP.pl"
fi
# /etc/httpd/conf/httpd.conf
cat "$SH_ROOT/append_httpd.conf" >> /etc/httpd/conf/httpd.conf
#systemctl start httpd.service

# 后台启动SVN Server脚本
#su - svn -c "svnserve -d --listen-port=3690 -r $SVN_ROOT"
cd $SVN_ROOT
echo "su - svn -c \"svnserve -d --listen-port=3690 -r $SVN_ROOT\"" > daemon_svnserve.sh
chmod u+x daemon_svnserve.sh
chown -R svn:apache $SVN_ROOT
sh daemon_svnserve.sh

# 其他客户端可以使用svn checkout下载svn仓库
# svn checkout svn://1.2.3.4:3690/demo/ mydemo/
# 也可以通过HTTP访问svn
# http://1.2.3.4:80/svn/demo/
