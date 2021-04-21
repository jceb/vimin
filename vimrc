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

" plugins {{{1

" dirvish {{{2
let g:dirvish_mode = ':sort ,^.*[\/],'

" ftplugin: svelte {{{2

function! OnChangeSvelteSubtype(subtype)
  echo 'Subtype is '.a:subtype
  if empty(a:subtype) || a:subtype == 'html'
    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:subtype =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  else
    setlocal commentstring=//%s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction
