#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < link-dotfiles.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/06/27 >
#   > Description:      快速建立dotfiles的软链接，实现个性化配置
#################################################################
dotfiles="$HOME/Code/dotfiles"

# download dotfiles
if [ ! -d "$dotfiles" ]; then
  mkdir -p "$HOME/Code"
  cd "$HOME/Code"
  git clone https://github.com/seanxp/dotfiles
fi
cd $dotfiles

# install oh-my-zsh
if [ -d "$dotfiles/zsh" ];then
  cd "$dotfiles/zsh"
  if [ ! -d "$HOME/.oh-my-zsh" ];then
    sh install-oh-my-zsh.sh
  fi
  sh ln-link.sh
fi

# install vimrc
if [ -d "$dotfiles/vim" ];then
  cd "$dotfiles/vim"
  sh install-plugin.sh
  sh ln-link.sh
fi

# install tmux
if [ -d "$dotfiles/tmux" ];then
  cd "$dotfiles/tmux"
  sh ln-link.sh
fi

# install git
if [ -d "$dotfiles/git" ];then
  cd "$dotfiles/git"
  sh ln-link.sh
fi
