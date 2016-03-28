#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#														  
#	> File Name:        < install-plugin.sh >
#	> Author:           < Sean Guo >		
#	> Mail:             < iseanxp+code@gmail.com >		
#	> Created Time:     < 2016/03/28 >
#	> Last Changed: 
#	> Description:      install vim plugin
#################################################################

vim_dir=$HOME/.vim
mkdir -p $vim_dir/bundle

# ctrlp.vim
# https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git $vim_dir/bundle/ctrlp.vim
