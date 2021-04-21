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

colorscheme nord

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

" lightline {{{2
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ 'component': {
            \   'bomb': '%{&bomb?"💣":""}',
            \   'diff': '%{&diff?"◑":""}',
            \   'lineinfo': ' %3l:%-2v',
            \   'modified': '%{&modified?"±":""}',
            \   'noeol': '%{&endofline?"":"!↵"}',
            \   'readonly': '%{&readonly?"":""}',
            \   'scrollbind': '%{&scrollbind?"∞":""}',
            \ },
            \ 'component_visible_condition': {
            \   'bomb': '&bomb==1',
            \   'diff': '&diff==1',
            \   'modified': '&modified==1',
            \   'noeol': '&endofline==0',
            \   'scrollbind': '&scrollbind==1',
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'neomake': 'LightLineNeomake'
            \ },
            \ 'active' : {
            \ 'left': [ [ 'winnr', 'neomake', 'mode', 'paste' ],
            \           [ 'bomb', 'diff', 'scrollbind', 'noeol', 'readonly', 'fugitive', 'filename', 'modified' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'inactive' : {
            \ 'left': [ [ 'winnr', 'diff', 'scrollbind', 'filename', 'modified' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ] ]
            \ },
            \ }

function! LightLineFugitive()
    if exists('*fugitive#head')
        let _ = fugitive#head()
        return strlen(_) ? '' : ''
    endif
    return ''
endfunction
