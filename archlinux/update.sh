#!/bin/bash
#################################################################
#   Copyright (C) 2015 Sean Guo. All rights reserved.
#														  
#	> File Name:        < update.sh >
#	> Author:           < Sean Guo >		
#	> Mail:             < iseanxp+code@gmail.com >		
#	> Created Time:     < 2015/12/09 >
#	> Last Changed:     < 2016/01/19 >
#	> Description:      auto update ArchLinux by crontab
# 
#           1. start cronie.service:
#               $ systemctl status cronie.service
#               $ sudo systemctl enable cronie.service
#               $ sudo systemctl status cronie.service
#         
#           2. and crontab task: $ crontab -e
#               01 1 * * * /home/gxp/update.sh
#
#           panman log:  /var/log/pacman.log
#################################################################

# -S, Synchronize packages.
# -y, Download a fresh copy of the master package list from the server(s) defined in pacman.conf(5).
# -u, Upgrade or add package(s) to the system and install the required dependencies from sync repositories.
sudo pacman -Syu --noconfirm
