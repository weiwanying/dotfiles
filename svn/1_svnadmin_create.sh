#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < svnadmin_create.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/06/27 >
#   > Description:      创建svn仓库，使用SVN_DEMO的配置文件
#
#################################################################

SVN_ROOT="/opt/svn"
SVN_DEMO="$SVN_ROOT/demo"

if [ $# -eq 0 ];then
  echo "Usage: $0 svn_project"
  exit 1
fi

for project in $@
do
  SVN_PROJECT="$SVN_ROOT/$project"
  if [ ! -d "$SVN_PROJECT" ];then
    # 创建svn project，并使用SVN_DEMO的配置文件
    svnadmin create "$SVN_PROJECT"
    # 配置SVN
    cd "$SVN_PROJECT/conf"
    # 配置SVN - svnserve.conf
    sed -i "/anon-access = read/ a anon-access = none" svnserve.conf
    sed -i "/auth-access = write/ a auth-access = write" svnserve.conf
    sed -i "/password-db = passwd/ a password-db = $SVN_DEMO/conf/passwd" svnserve.conf
    sed -i "/authz-db = authz/ a authz-db = $SVN_DEMO/conf/authz" svnserve.conf
    sed -i "/realm = My First Repository/ a realm = `echo -n $HOSTNAME` SVN Server" svnserve.conf
    # 配置SVN - authz
    cd "$SVN_DEMO/conf"
    sed -i "$ a [$project:/]" authz
    sed -i "$ a $USER = rw" authz
    # 配置权限
    chown -R svn:apache $SVN_PROJECT
  fi
done
