#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && command -v startxfce4 && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec startxfce4 
elif [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ -z "$TMUX" ] \
		&& command -v fbterm && command -v tmux ; then
  fbterm -s20 tmux -n "DejaVu Sans Mono:style=bold"
fi
