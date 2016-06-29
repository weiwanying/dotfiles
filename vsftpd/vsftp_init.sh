#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < vsftp_init.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/06/27 >
#   > Description:      创建ftp服务器 - CentOS
#################################################################

FTP_ROOT="/var/vsftpd"
SH_ROOT=`pwd`

#{{{ 1. install vsftpd
# 查看是否已安装vsftpd
#rpm -qa | grep vsftpd
# 安装vsftpd
yum -y install vsftpd
# 配置开机启动
chkconfig vsftpd on

# 提前安装Barkeley DB工具，之后生成db文件要用到
yum -y install db4 db4-utils
#}}}
#{{{ 2. /etc/vsftpd/vsftpd.conf
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.bak
if [ -f "centos_vsftpd.conf" ]; then
  cp centos_vsftpd.conf /etc/vsftpd/vsftpd.conf
else
  echo "error: not found centos_vsftpd.conf"
  exit 1
fi
#}}}
#{{{ 3. vsftpd virtual user
cd /etc/vsftpd
# 生成虚拟用户文件
echo "seanxp" > virtusers
echo "sean@359#XP" >> virtusers
echo "db_load -T -t hash -f /etc/vsftpd/virtusers /etc/vsftpd/virtusers.db" > generate_db.sh
chmod u+x generate_db.sh
sh generate_db.sh
mkdir -p /etc/vsftpd/vconf
# 虚拟用户seanxp的ftp配置
echo "local_root=/var/vsftpd/ftp" > /etc/vsftpd/vconf/seanxp
echo "write_enable=YES" >> /etc/vsftpd/vconf/seanxp
echo "anon_umask=022" >> /etc/vsftpd/vconf/seanxp
#}}}
#{{{ 4. /etc/pam.d/vsftpd
cp /etc/pam.d/vsftpd /etc/pam.d/vsftpd.bak
echo "auth required pam_userdb.so db=/etc/vsftpd/virtusers" > /etc/pam.d/vsftpd
echo "account required pam_userdb.so db=/etc/vsftpd/virtusers" >> /etc/pam.d/vsftpd
#}}}
#{{{ 5. SElinux
setsebool -P ftp_home_dir=1
sersebool -P allow_ftpd_full_access=1
#}}}
#{{{ 6. FTP root
# 创建FTP用户，且不配置密码（不可登录），仅用于运行ftp服务
useradd -c "ftp user" -M vsftpd -s /sbin/nologin -d $FTP_ROOT
mkdir -p "$FTP_ROOT/ftp"
chown -R vsftpd:vsftpd $FTP_ROOT
chmod a-w $FTP_ROOT
chmod 777 "$FTP_ROOT/ftp"
#}}}

# 重启vsftpd服务
service vsftpd start
#service vsftpd restart
