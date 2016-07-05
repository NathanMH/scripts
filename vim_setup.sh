#!/bin/bash

mkdir -p ~/.vim

if [ ! -d ~/Documents/dotfiles/ ]; then
    echo "dotfiles doesn't exist, cloning..."
    git clone https://github.com/NathanMH/dotfiles ~/Documents/
fi

if [ ! -d ~/.vim/autoloads/ ]; then
    # Get Pathogen going
    echo "Vim bundles/autoload don't exist, cloning..."
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \

    echo "Getting Pathogen..."
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    
    # GET ALL THE PLUGINS!
    git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion.vim
    git clone https://github.com/tpope/vim-surround ~/.vim/bundle/vim-surround.vim
fi

cp ~/Documents/dotfiles/vim/.vimrc ~/
cp -r ~/Documents/dotfiles/vim/colors/ ~/.vim/
