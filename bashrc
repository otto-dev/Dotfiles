# If not running interactively, don't do anything
COLOR="\[\033[01;1m\]"

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

[[ $- != *i* ]] && return

# Show Git status in terminal
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="${USERNAME}\[\033[01;34m\]${COLOR}[\h] \w\[\033[01;33m\]\$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] "

# Allow Ctrl-S and Ctrl-Q without freezing terminal
stty -ixon 

# Git status in command line
source ~/Dotfiles/bashrc-files/git-status-line

# bash aliases
source ~/Dotfiles/bashrc-files/git-completion
source ~/Dotfiles/bashrc-files/aliases

# Sensible bash
source ~/Dotfiles/bashrc-files/sensible

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

#PAGER='less -s' psql

