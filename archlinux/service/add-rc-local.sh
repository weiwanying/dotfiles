#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#	> File Name:        < add-rc-local.sh >
#	> Author:           < Sean Guo >
#	> Mail:             < iseanxp+code@gmail.com >
#	> Created Time:     < 2016/03/28 >
#	> Last Changed:
#	> Description:      add rc-local service for arch linux
#################################################################

# 1. add rc-local.service
#    this service will fork a process to run /etc/rc.local
sudo cp rc-local.service /usr/lib/systemd/system/rc-local.service

# 2.
sudo echo '#!/bin/bash' > /etc/rc.local
sudo chmod u+x /etc/rc.local

# 3. enable this server
sudo systemctl enable rc-local.service


