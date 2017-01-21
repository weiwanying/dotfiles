#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#    > File Name:        < install-plugin.sh >
#    > Author:           < Sean Guo >
#    > Mail:             < iseanxp+code@gmail.com >
#    > Created Time:     < 2016/03/28 >
#    > Last Changed:
#    > Description:      install vim plugin - vundle
#                        Vundle is short for Vim bundle and is a Vim plugin manager.
#################################################################

vim_dir="$HOME/.vim"
bundle_dir="$vim_dir/bundle"

if [ ! -d "$bundle_dir" ];then
  mkdir -p $vim_dir/bundle
  # https://github.com/VundleVim/Vundle.vim
  git clone https://github.com/VundleVim/Vundle.vim.git $vim_dir/bundle/Vundle.vim
fi

# install all plugin by vundle.vim
vim +PluginClean +qall
vim +PluginInstall +qall
#vim +PluginUpdate +qall
