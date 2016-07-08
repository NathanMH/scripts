#!/bin/bash

mkdir -p ~/.emacs.d
mkdir -p ~/.emacs.d/init

if [ ! -d ~/Documents/dotfiles/ ]; then
    echo "dotfiles doesn't exist, cloning..."
    git clone https://github.com/NathanMH/dotfiles ~/Documents/
fi
 
if [ ! -d ~/.emacs.d/init/ ]; then
    cp ~/Documents/dotfiles/emacs/init.el ~/.emacs.d/
    cp ~/Documents/dotfiles/emacs/monokai-theme.el ~/.emacs.d/
    cp -r ~/Documents/dotfiles/emacs/init/ ~/.emacs.d/
fi
