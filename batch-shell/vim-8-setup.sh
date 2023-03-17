#!/bin/bash

mkdir -p ~/.vim

if [ ! -d ~/Documents/dotfiles/ ]; then
    echo "dotfiles doesn't exist, cloning..."
    git clone https://github.com/NathanMH/dotfiles ~/Documents/
fi

# Plugins
git clone https://github.com/tpope/vim-surround ~/.vim/pack/musicnate/start/surround
git clone https://github.com/tpope/vim-commentary ~/.vim/pack/musicnate/start/commentary
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/musicnate/start/lightline
git clone https://github.com/itchyny/calendar.vim ~/.vim/pack/musicnate/start/calendar
git clone https://github.com/Raimondi/delimitMate.git ~/.vim/pack/musicnate/start/delimitMate
git clone https://github.com/Yggdroot/indentLine ~/.vim/pack/musicnate/start/indentLine
git clone https://github.com/easymotion/vim-easymotion ~/.vim/pack/musicnate/start/easymotion
git clone https://github.com/kien/rainbow_parentheses.vim ~/.vim/pack/musicnate/start/rainbowparentheses
git clone https://github.com/mhinz/vim-startify ~/.vim/pack/musicnate/start/startify

# Get fonts
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
