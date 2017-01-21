#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#	> File Name:        < link.sh >
#	> Author:           < Sean Guo >
#	> Mail:             < iseanxp+code@gmail.com >
#	> Created Time:     < 2016/03/26 >
#	> Last Changed:     < 2017/01/21 >
#	> Description:      hammerspoon config automatic deployment
#################################################################

dotfile="init.lua"
base_dir="$HOME/.hammerspoon"
target="$base_dir/$dotfile"

modules_dir="$base_dir/modules"
modules_files="`ls -1 modules`"

if [ -d $modules_dir ];then
  rm -r $modules_dir
fi
mkdir -p $base_dir $modules_dir

# backup old config file
if [ -f "$target" ];then
  mv "$target" "$target.old"
fi

# make soft link
ln -s `pwd`/$dotfile "$target"
for lua in $modules_files
do
  ln -s "`pwd`/modules/$lua" $modules_dir
done
