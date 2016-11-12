#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#	> File Name:        < brew-update.sh >
#	> Author:           < Sean Guo >
#	> Mail:             < iseanxp+code@gmail.com >
#	> Created Time:     < 2016/03/28 >
#	> Description:
#################################################################

brew="/usr/local/bin/brew"

echo "==> `date +%Y/%m/%d-%H:%M:%S`"
$brew update
$brew upgrade
$brew cleanup

$brew cask update
$brew cask cleanup
