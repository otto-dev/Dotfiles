# If not running interactively, don't do anything
COLOR="\[\033[01;1m\]"

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

[[ $- != *i* ]] && return

# Show Git status in terminal
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033[01;34m\]${COLOR}[${USERNAME}@\h] \w\[\033[01;33m\]\$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] "
export TERM=xterm-256color
export PATH="$(realpath ~)/.local/bin:$(realpath ~)/.daml/bin:$PATH:$(realpath ~)/.nix-profile/bin"

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

export EDITOR=/usr/bin/vim

#PAGER='less -s' psql

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

if command -v direnv; then
  eval "$(direnv hook bash)"
fi
# Activate Python virtual environment if present

activate_venv() {
    if [[ -d "./venv/bin" ]]; then
        source "./venv/bin/activate"
    fi
}

# This will execute the function every time you change directory.
# It appends the function to the existing PROMPT_COMMAND with a semicolon delimiter,
# thus preserving any existing PROMPT_COMMAND configuration.

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }activate_venv"

