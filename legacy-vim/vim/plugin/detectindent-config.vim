" Unfortunately DetectIndent does not leave 'expandtab' at its predefined
" value when indentation cannot be detected. So a default for those cases
" must be defined here.
let g:detectindent_preferred_expandtab = 1

" Execute when file is read
autocmd BufReadPost * :DetectIndent|let &tabstop = &shiftwidth

" Do what you can
let g:detectindent_preferred_when_mixed = 0
