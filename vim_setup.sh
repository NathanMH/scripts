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
    git clone git://github.com/tpope/vim-surround ~/.vim/bundle/surround
    git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/commentary
    git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/easymotion
    git clone https://github.com/kien/rainbow_parenthesis.vim ~/.vim/bundle/rainbow
    git clone https://github.com/itchyny/calendar.vim ~/.vim/bundle/calendar
    git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline

    # Get patchet fonts
    git clone https://github.com/powerline/fonts ~/Documents/fonts
    bash ~/Documents/fonts/install.sh
fi

cp ~/Documents/dotfiles/vim/.vimrc ~/
cp -r ~/Documents/dotfiles/vim/colors/ ~/.vim/
