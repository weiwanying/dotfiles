#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#    > File Name:        < ln-link.sh >
#    > Author:           < Sean Guo >
#    > Mail:             < iseanxp+code@gmail.com >
#    > Created Time:     < 2016/09/04 >
#    > Last Changed:
#    > Description:
#################################################################

for dotfile in `find . -name 'git*' -exec basename {} \;`
do
  target="$HOME/.$dotfile"

  if [ -f "$target" ];then
    # backup old config file
    mv "$target" "$target".old
  fi
  # make soft link
  ln -s `pwd`/$dotfile "$target"
done
