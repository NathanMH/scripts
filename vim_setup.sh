#!/bin/bash

mkdir -p ~/.vim

if [ ! -d ~/Documents/dotfiles/ ]; then
    echo "dotfiles doesn't exist, cloning..."
    git clone https://github.com/NathanMH/dotfiles ~/Documents/
fi

if [ ! -d ~/.vim/autoloadsss/ ]; then
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

    # Syntax Checking 
    git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
    sudo apt-get install pylint -y # Python
    sudo apt-get install luarocks -y # Needed for easy installation of LuaCheck
    luarocks install luacheck # Installs Lua syntax checker
    gem install ruby-lint # Installs Ruby syntax checker
    pip install vim-vint # Installs VimL syntax checker
    # TODO 
    ## C syntax checker
    ## C++ syntax checker
    ## Objective-C syntax checker
    ## Bash(sh) syntax checker (shellcheck)

    # Get fonts
    git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
    fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
fi

cp ~/Documents/dotfiles/vim/.vimrc ~/
cp -r ~/Documents/dotfiles/vim/colors/ ~/.vim/
