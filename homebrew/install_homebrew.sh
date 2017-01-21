#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < install_homebrew.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/01/21 >
#   > Description:      http://brew.sh/
#################################################################

# 0. install "Xcode Command Line Tools"
# 1. install homebrew ( need sudo )
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# 2. change /usr/local owner and group, no more sudo.
sudo chown -R $USER:admin /usr/local
