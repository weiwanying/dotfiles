#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#														  
#	> File Name:        < install.sh >
#	> Author:           < Sean Guo >		
#	> Mail:             < iseanxp+code@gmail.com >		
#	> Created Time:     < 2016/03/28 >
#	> Last Changed: 
#	> Description:
#################################################################

# must have
sudo pacman -S --noconfirm tmux vim zsh git

# ssh
sudo pacman -S --noconfirm openssh 

# download tool
sudo pacman -S --noconfirm aria2 wget curl transmission-cli

# system tool
sudo pacman -S --noconfirm ack cron ctags mlocate htop tree xz

# program tool
sudo pacman -S --noconfirm python gdb 

# other 
sudo pacman -S --noconfirm minicom fuse-exfat

# clean
sudo pacman -Sc --noconfirm
