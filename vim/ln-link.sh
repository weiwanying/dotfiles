#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#														  
#	> File Name:        < ln-link.sh >
#	> Author:           < Sean Guo >		
#	> Mail:             < iseanxp+code@gmail.com >		
#	> Created Time:     < 2016/03/01 >
#	> Last Changed: 
#	> Description:
#################################################################

#!/bin/bash
dotfile="vimrc"
target="/home/`whoami`/.$dotfile"

if [ -f "$target" ];then
  # backuo old config file
  mv "$target" "$target".old
fi

# make soft link
ln -s `pwd`/$dotfile "$target"
