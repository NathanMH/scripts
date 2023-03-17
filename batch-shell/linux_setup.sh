#!/bin/sh

mkdir ~/tmp

# General symlinks
rm /etc/lxdm/lxdm.conf
ln -s ~/Documents/dotfiles/lxdm /etc/lxdm/lxdm.config
rm ~/.Xmodmap
ln -s ~/Documents/dotfiles/.Xmodmap ~/.Xmodmap
rm ~/.bashrc
ln -s ~/Documents/dotfiles/.bashrc ~/.bashrc
rm ~/.inputrc
ln -s ~/Documents/dotfiles/.inputrc ~/.inputrc
rm ~/.xinitrc
ln -s ~/Documents/dotfiles/.xinitrc ~/.xinitrc
rm ~/.profile
ln -s ~/Documents/dotfiles/.profile ~/.profile

# Setup i3
mkdir ~/.i3/
rm ~/.i3blocks.conf
ln -s ~/Documents/dotfiles/i3/i3blocks.conf ~/.i3status.conf
# rm ~/.i3status.conf
# ln -s ~/Documents/dotfiles/i3/i3status.conf ~/.i3status.conf
rm -r ~/.i3
ln -s ~/Documents/dotfiles/i3/ ~/.i3

# Other
setxkbmap us colemak
xmodmap ~/.Xmodmap
