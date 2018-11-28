#!/bin/zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

# SSH
chmod 600 $HOME/.ssh/config

# Aliases
alias emacs="/usr/local/Cellar/emacs/26.1_1/Emacs.app/Contents/MacOS/Emacs -nw"
