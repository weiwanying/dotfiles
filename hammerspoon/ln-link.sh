#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#														  
#	> File Name:        < ln-link.sh >
#	> Author:           < Sean Guo >		
#	> Mail:             < iseanxp+code@gmail.com >		
#	> Created Time:     < 2016/03/26 >
#	> Last Changed: 
#	> Description:
#################################################################

#!/bin/bash
dotfile="init.lua"
base_dir="$HOME/.hammerspoon"
target="$base_dir/$dotfile"

modules_dir="$base_dir/modules"
modules_files="`ls -1 modules`"

rm -r $modules_dir
mkdir -p $base_dir $modules_dir

# backuo old config file
if [ -f "$target" ];then
  mv "$target" "$target".old
fi

# make soft link
ln -s `pwd`/$dotfile "$target"

for lua in $modules_files
do
  ln -sf "`pwd`/modules/$lua" $modules_dir
done
