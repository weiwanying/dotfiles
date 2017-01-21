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

  # not softlink, copy for more change.
  cp `pwd`/$dotfile "$target"
done
