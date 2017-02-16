#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#    > File Name:        < link.sh >
#    > Author:           < Sean Guo >
#    > Mail:             < iseanxp+code@gmail.com >
#    > Created Time:     < 2017/02/16 >
#################################################################

dotfile="mpv.conf"
target="$HOME/.config/mpv/$dotfile"

if [ -f "$target" ];then
  # backup old config file
  mv "$target" "$target.old"
fi

# make soft link
ln -s `pwd`/$dotfile "$target"
