#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#    > File Name:        < link.sh >
#    > Author:           < Sean Guo >
#    > Mail:             < iseanxp+code@gmail.com >
#    > Created Time:     < 2017/01/21 >
#    > Description:
#################################################################

mkdir -p "$HOME/.aria2"

for dotfile in `find . -name 'aria?*' -exec basename {} \;`
do
  target="$HOME/.aria2/$dotfile"

  if [ -f "$target" ];then
    mv "$target" "$target.old"
  fi

  # not soft link, copy for more configure.
  cp `pwd`/$dotfile "$target"
done

touch "$HOME/.aria2/aria2.session"
touch "$HOME/.aria2/aria2.log"
