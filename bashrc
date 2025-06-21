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

# Enhanced bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Additional completion options
shopt -s globstar 2> /dev/null  # Enable ** for recursive directory matching
shopt -s dotglob 2> /dev/null   # Include hidden files in pathname expansion
shopt -s extglob 2> /dev/null   # Enable extended pattern matching

# Custom completion for common commands
complete -W "$(echo $(grep '^ssh ' ~/.bash_history 2>/dev/null | sort -u | sed 's/^ssh //'))" ssh
complete -W "$(echo $(grep '^scp ' ~/.bash_history 2>/dev/null | sort -u | sed 's/^scp //'))" scp

# Load custom completions
source ~/Dotfiles/bashrc-files/completions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR=/usr/bin/vim

#PAGER='less -s' psql

# History settings moved to sensible.bash
# shopt -s histappend is already in sensible

if command -v direnv >/dev/null 2>&1; then
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

# Combine with sensible's PROMPT_COMMAND
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND:+$PROMPT_COMMAND; }activate_venv"

