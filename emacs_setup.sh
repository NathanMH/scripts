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

# Get plugins from Github
if [ ! -d ~/.emacs.d/elpa/ ]; then
    mkdir -p ~/.emacs.d/elpa
    git clone https://github.com/winterTTr/ace-jump-mode                ~/.emacs.d/elpa/
    git clone https://github.com/kiwanami/emacs-calfw                   ~/.emacs.d/elpa/
    git clone https://github.com/emacsmirror/centered-cursor-mode       ~/.emacs.d/elpa/
    git clone https://github.com/company-mode/company-mode              ~/.emacs.d/elpa/
    git clone https://github.com/emacsmirror/evil                       ~/.emacs.d/elpa/
    git clone https://github.com/cofi/evil-leader                       ~/.emacs.d/elpa/
    git clone https://github.com/flycheck/flyckeck                      ~/.emacs.d/elpa/
    git clone https://github.com/deactivated/hl-tags-mode               ~/.emacs.d/elpa/
    git clone https://github.com/emacsmirror/keychord                   ~/.emacs.d/elpa/
    git clone https://github.com/jsinglet/latex-preview-pane            ~/.emacs.d/elpa/
    git clone https://github.com/jaypei/emacs-neotree                   ~/.emacs.d/elpa/
    git clone https://github.com/milkypostman/powerline                 ~/.emacs.d/elpa/
    git clone https://github.com/Fanael/rainbow-delimiters              ~/.emacs.d/elpa/
    git clone https://github.com/timchaper/evil-surround                ~/.emacs.d/elpa/
    git clone https://github.com/7696122/evil-terminal-cursor-changer   ~/.emacs.d/elpa/
    git clone https://github.com/edwtjo/evil-org-mode                   ~/.emacs.d/elpa/
    git clone https://github.com/JorisE/evil-mu4e                       ~/.emacs.d/elpa/
fi
