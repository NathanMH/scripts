#!/bin/sh

# Make symlinks and other minor changes
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

# Setup i3
mkdir ~/.i3/
rm ~/.i3status.conf
ln -s ~/Documents/dotfiles/i3/i3status.conf ~/.i3status.conf
ln -s ~/Documents/dotfiles/i3/i3/ ~/.i3/

# Other
setxkbmap -layout "us" -variant colemak
xmodmap ~/.Xmodmap
