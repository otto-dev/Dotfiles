" Show contents in current buffer in browser
nmap <M-z>pre :w !TEMPFILE=`mktemp` && grip - --export $TEMPFILE &> /dev/null && google-chrome-stable $TEMPFILE &> /dev/null<CR><CR>

