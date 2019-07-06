# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ignatius/.fzf/bin* ]]; then
  export PATH="$PATH:/home/ignatius/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/key-bindings.bash" 2> /dev/null
[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null


# Key bindings
# ------------
# source "/usr/share/fzf/key-bindings.bash"

export FZF_DEFAULT_COMMAND='ag --hidden --follow --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
