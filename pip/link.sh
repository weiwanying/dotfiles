#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#    > File Name:        < link.sh >
#    > Author:           < Sean Guo >
#    > Mail:             < iseanxp+code@gmail.com >
#    > Created Time:     < 2017/02/06 >
#    > Description:
#################################################################

base="pip"
mkdir -p "$HOME/.$base"

for dotfile in `find . -name "$base?*" -exec basename {} \;`
do
  target="$HOME/.$base/$dotfile"

  if [ -f "$target" ];then
    # backup old config file
    mv "$target" "$target.old"
  fi

  # make soft link
  ln -s `pwd`/$dotfile $target
done

