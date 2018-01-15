" put any pre configuration settings in this file {{{1
runtime! vimrc-local-pre

" initialize pathogen / runtimepath {{{1
call map(minptg#findsubdir(&runtimepath, "pathogen"), "minptg#addtortp(v:val)")

execute pathogen#infect()

" settings {{{1

" general {{{2
set number
if exists('&relativenumber')
    set relativenumber
endif
if has('virtualedit')
    set virtualedit=block,onemore
endif
set splitright
set splitbelow

" dirvish {{{2
let g:dirvish_mode = ':sort ,^.*[\/],'

" put any other local configuration settings in this file {{{1
runtime! vimrc-local
