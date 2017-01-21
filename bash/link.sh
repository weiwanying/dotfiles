#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#    > File Name:        < link.sh >
#    > Author:           < Sean Guo >
#    > Mail:             < iseanxp+code@gmail.com >
#    > Created Time:     < 2016/04/16 >
#    > Last Changed:
#    > Description:
#################################################################

dotfile="bashrc"
target="$HOME/.$dotfile"

if [ -f "$target" ];then
  # backup old config file
  mv "$target" "$target.old"
fi

# make soft link
ln -s `pwd`/$dotfile $target
