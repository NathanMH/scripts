#!/bin/bash

mkdir -p ~/.emacs.d

if [ ! -d ~/Documents/dotfiles/ ]; then
    echo "dotfiles doesn't exist, cloning..."
    git clone https://github.com/NathanMH/dotfiles ~/Documents/
fi
 
if [ ! -d ~/.emacs.d/ ]; then
    cp ~/Documents/dotfiles/emacs/init.el ~/.emacs.d/
fi

