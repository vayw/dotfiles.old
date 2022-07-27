set nu

autocmd BufWritePre *.yaml,*.yml normal m`:%s/\s\+$//e ``

setlocal autoindent sw=2 ts=2 expandtab
setlocal iskeyword+=-
" vim:set sw=2:
