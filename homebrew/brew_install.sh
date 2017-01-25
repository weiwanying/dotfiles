#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#	> File Name:        < brew_install.sh >
#	> Author:           < Sean Guo >
#	> Mail:             < iseanxp+code@gmail.com >
#	> Created Time:     < 2016/03/28 >
#	> Last Changed:     < 2017/01/21 >
#	> Description:
#################################################################

brew="/usr/local/bin/brew"

$brew install ack
$brew install aria2
$brew install bash
$brew install binutils
$brew install cmake
$brew install cscope
$brew install ctags
$brew install curl
$brew install ffmpeg
$brew install gdb
$brew install git
$brew install graphviz
$brew install gpg2
$brew install htop
$brew install httpie
$brew install iproute2mac
$brew install libmagic
$brew install nmap
$brew install node
$brew install p7zip
$brew install pandoc
$brew install perl
$brew install python
$brew install python3
$brew install ruby
$brew install ssh-copy-id
$brew install shadowsocks-libev
$brew install tmux
$brew install tree
$brew install weechat
$brew install youtube-dl
$brew install zsh

#{{{ Install the GNU Command Line Tools
# https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
$brew tap homebrew/dupes
$brew install coreutils
$brew install diffutils
$brew install gawk
$brew install gnutls
$brew install gzip
$brew install wdiff --with-gettext
$brew install wget
$brew install openssh
$brew install less
# The --default-names option will prevent Home$brew from prepending a g to each of the newly installed commands, thus we could use these commands as default commands over the ones shipped by OS X.
$brew install grep --with-default-names
$brew install ed --default-names
$brew install findutils --with-default-names
$brew install gnu-sed --with-default-names
$brew install gnu-tar --with-default-names
$brew install gnu-which --with-default-names
$brew install gnu-indent --with-default-names
# In addition, some GNU command line tools already exist by default on OS X, but you may want a newer version:
$brew install bash
$brew install gdb  # gdb requires further actions to make it work. See `$brew info gdb`.
$brew install gpatch
$brew install m4
$brew install make
$brew install vim --override-system-vi
#}}}
