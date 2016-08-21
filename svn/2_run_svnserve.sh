#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < 2_run_svnserve.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/08/21 >
#   > Description:    使用svn用户运行svnserve服务，确保权限问题。（如果是普通用户运行svnserve，对仓库无写权限）
#################################################################
su - svn -c "svnserve -d --listen-port=3690 -r /opt/svn"
