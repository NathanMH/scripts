#!/bin/bash

mkdir -p ~/.vim

if [ ! -d ~/Documents/dotfiles/ ]; then
    echo "dotfiles doesn't exist, cloning..."
    git clone https://github.com/NathanMH/dotfiles ~/Documents/
fi

if [ ! -d ~/.vim/autoload/ ]; then
    # Get Pathogen going
    echo "Vim bundles/autoload don't exist, cloning..."
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \

    echo "Getting Pathogen..."
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    
    # GET ALL THE PLUGINS!
    git clone https://github.com/itchyny/calendar.vim ~/.vim/bundle/calendar
    git clone https://github.com/Raimondi/delimitMate.git ~/.vim/bundle/delimitmate
    git clone https://github.com/Yggdroot/indentLine ~/.vim/bundle/indentline
    git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline
    git clone https://github.com/kien/rainbow_parentheses.vim ~/.vim/bundle/rainbowparentheses
    git clone git://github.com/tpope/vim-surround ~/.vim/bundle/surround
    git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/commentary
    git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/easymotion
    git clone https://github.com/SirVer/ultisnips ~/.vim/bundle/ultisnips
    git clone https://github.com/airblade/vim-rooter ~/.vim/bundle/vim-rooter

    # Syntax Checking 
    git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
    sudo apt-get install pylint -y # Python syntax checker
    sudo apt-get install luarocks -y # Needed for easy installation of LuaCheck
    luarocks install luacheck # Lua syntax checker
    gem install ruby-lint # Ruby syntax checker
    pip install vim-vint # VimL syntax checker
    apt-get install shellcheck # Bash shell script syntax checker

    # Autocomplete 
    git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/youcompleteme
    git submodule update --init --recursive
    python3 ~/.vim/bundle/youcompleteme/.install.py --clang-completer

    # Get fonts
    git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
    fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
fi

cp ~/Documents/dotfiles/vim/.vimrc ~/
cp -r ~/Documents/dotfiles/vim/colors/ ~/.vim/
