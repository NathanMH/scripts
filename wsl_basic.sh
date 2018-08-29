#!/bin/sh

apt install zsh

# if ! ~/.vimrc

if [ ! -f ~/.vimrc ]; then

    rm /home/natha/.bashrc
    ln -s /home/natha/Documents/dotfiles/linux/bash/.bashrc ~/.bashrc
    ln -s /home/natha/Documents/dotfiles/linux/bash/.inputrc ~/.inputrc
    ln -s /home/natha/Documents/dotfiles/linux/x/.Xresources ~/.Xresources

    ln -s /home/natha/Documents/dotfiles/linux/vim/.vimrc ~/.vimrc
    ln -s /home/natha/Documents/dotfiles/linux/vim/.vim ~/.vim

    ln -s /home/natha/Documents/dotfiles/linux/zsh/.zshrc ~/.zshrc
    ln -s /home/natha/Documents/dotfiles/linux/zsh/.zsh ~/.zsh
fi
