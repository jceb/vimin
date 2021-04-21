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
if !isdirectory($HOME."/.local/share/vim/swap")
    call mkdir($HOME."/.local/share/vim/swap", 'p')
endif
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
