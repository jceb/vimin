" load plugins {{{1
if !exists('&packpath')
    call map(minptg#findsubdir(&runtimepath, "pathogen"), "minptg#addtortp(v:val)")

    execute pathogen#infect()
endif

" settings {{{1

" general {{{2
set number
if exists('&relativenumber')
    set relativenumber
endif
if has('virtualedit')
    set virtualedit=block,onemore
endif
set copyindent
set directory=~/.local/share/vim/swap//
set gdefault
set hidden
set ignorecase
set nofoldenable
set pastetoggle=<F11>
set splitbelow
set splitright

" dirvish {{{2
let g:dirvish_mode = ':sort ,^.*[\/],'
