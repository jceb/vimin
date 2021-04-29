" settings {{{1
" Global Settings: {{{2
" ----------------

" Prevent modelines in files from being evaluated (avoids a potential
" security problem wherein a malicious user could write a hazardous
" modeline into a file) (override default value of 5)
set modeline
set modelines=5


" Miscellaneous Settings: {{{2
" -----------------------

set commentstring=#%s          " set default comment string to octothorpe
set comments=b:#,fb:-,fb:*     " Remove some legacy and C comment strings
set path=.,,                   " limit path
set swapfile                   " write swap files
set directory=~/.cache/vim/swap//  " place swap files outside the current directory
set nobackup                   " don't write backup copies
set writebackup                " write a backup before writing a file
set gdefault                   " substitute all matches by default
set ignorecase                 " ignore case by default for search patterns
set magic                      " special characters that can be used in search patterns
set hidden                     " allow hidden buffers with modifications
set whichwrap=<,>              " Cursor key move the cursor to the next/previous line if pressed at the end/beginning of a line
set backspace=indent,eol,start " more powerful backspacing
set grepprg=rg\ --vimgrep      " use ripgrep

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe
set sessionoptions-=options    " do not store global and local values in a session
set sessionoptions-=folds      " do not store folds
set switchbuf=usetab           " This option controls the behavior when switching between buffers.
" set nottimeout                 " if terminal sends 0x9b ttimeout can be disabled
set printoptions=paper:a4,syntax:n " controls the default paper size and the printing of syntax highlighting (:n -> none)
" let mapleader='\'              " change map leader to a key that's more convenient to reach
set updatetime=300             " timeout for triggering the CursorHold auto command

" enable persistent undo and save all undo files in ~/.cache/vimundo
if has('persistent_undo')
	exec 'set undodir='.fnameescape($HOME.'/.cache/vim/undo//')
	set undofile
	if ! isdirectory(&undodir)
		call mkdir(&undodir, 'p')
	endif
endif

" play nicely with fish shell
if &shell =~# 'fish$'
    set shell=bash
endif

" Visual Settings: {{{2
" ----------------

set lazyredraw                 " draw screen updates lazily
set showmode                   " show vim's current mode
set showcmd                    " show vim's current command
set showmatch                  " highlight mathing brackets
set nohlsearch                 " don't highlight search results by default as I'm using them to navigate around
set nowrap                     " don't wrap long lines by default
set mouse=a                    " Enable the use of a mouse
set cursorline                 " Don't show cursorline
set noerrorbells               " disable error bells
set novisualbell               " disable beep
set wildmode=list:longest,full " Don't start wildmenu immediately but list the alternatives first and then do the completion if the user requests it by pressing wildkey repeatedly
set wildignore-=tmp
set wildignore+=*.DS_STORE,*~,*.bak,*.o,*.obj,*.pyc,.git,.svn,.hg,node_modules,.pc
set wildcharm=<C-Z>            " Shortcut to open the wildmenu when you are in the command mode - it's similar to <C-D>
set guicursor=n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20,a:blinkon0-Cursor/lCursor  " cursor-blinking off!!
set nofoldenable               " start editing with all folds open
set foldmethod=indent          " Use indent for folding by default
"set foldminlines=0             " number of lines above which a fold can be displayed
set linebreak                  " If on Vim will wrap long lines at a character in 'breakat'
set breakindent                " indent wrapped lines visually
set showtabline=2              " always show tabline, even if there is just one tab, avoid redraw problems when Window is displayed in fullscreen mode
"set foldcolumn=1               " show folds
set colorcolumn=+1             " color specified column in order to help respecting line widths
set termguicolors              " true color for the terminal
set number relativenumber      " show linenumbers
" set signcolumn=number          " display signs in number column
set completeopt=menuone,preview,noinsert,noselect  " show the complete menu even if there is just one entry
set splitright                 " put the new window right of the current one
set splitbelow                 " put the new window below the current one
set list                       " list nonprintable characters
if $LANG =~ '.*\.UTF-8$' || $LANG =~ '.*utf8$' || $LANG =~ '.*utf-8$'
	set listchars=tab:»\ ,trail:·,nbsp:␣ " list nonprintable characters
	set showbreak=↪\           " identifier put in front of wrapped lines
endif
set fillchars=vert:\ ,diff:·,fold:·   " get rid of the gab between the vertical bars
" set fillchars=vert:\ ,diff:·,fold:·,eob:│   " get rid of the gab between the vertical bars
set scrolloff=3                " always show context at top and bottom
set guioptions=aegimtc         " disable scrollbars
set cpoptions=aABceFsq         " q: When joining multiple lines leave the cursor at the position where it would be when joining two lines.
                               " $:  When making a change to one line, don't redisplay the line, but put a '$' at the end of the changed text.
                               " v: Backspaced characters remain visible on the screen in Insert mode.
                               " J: a sentence is followed by two spaces
" set synmaxcol=200              " stop syntax highlighting at a certain column to improve speed
if has("nvim")
set inccommand=split           " preview changes of substitute commands in a separate window
endif
set report=0                   " report every changed line

" Text Settings: {{{2
" --------------

set clipboard-=autoselect    " disable itegration with X11 clipboard
set virtualedit=block,onemore " allow the cursor to move beyond the last character of a line
set copyindent               " always copy indentation level from previous line
set nocindent                " disable cindent - it doesn't go well with formatoptions
set textwidth=80             " default textwidth
set shiftwidth=4             " number of spaces to use for each step of indent
set tabstop=4                " number of spaces a tab counts for
set softtabstop=4            " number of spaces a tab counts for
set expandtab                " insert tabs instead of spaces
set nosmartcase              " smart case search (I don't like it that much since it makes * and # much harder to use)
set formatoptions=crqj       " no automatic linebreak, no whatsoever expansion
set pastetoggle=<F11>        " put vim in pastemode - usefull for pasting in console-mode
set iskeyword+=_             " these characters also belong to a word
"set matchpairs+=<:>          " angle brackets should also being matched by %
set complete+=i              " scan included files and dictionary (if spell checking is enabled)

" Colorscheme {{{2

colorscheme nord

" keybindings {{{2

" fix Y
nnoremap Y y$

" select last paste visually
nnoremap gV `]v`[

" format paragraphs quickly
nnoremap Q gwip
xnoremap Q gw

" use space key for something useful
nnoremap <Space>1 1<C-w>w
nnoremap <Space>2 2<C-w>w
nnoremap <Space>3 3<C-w>w
nnoremap <Space>4 4<C-w>w
nnoremap <Space>5 5<C-w>w
nnoremap <Space>6 6<C-w>w
nnoremap <Space>7 7<C-w>w
nnoremap <Space>8 8<C-w>w
nnoremap <Space>9 9<C-w>w
nnoremap <Space><Space> <cmd>update<CR>
nnoremap <Space>bd <cmd>Sayonara!<CR>
nnoremap <Space>bW <cmd>bw #<CR>
nnoremap <Space>bw <cmd>bw<CR>
nnoremap <Space>CM "*P
nnoremap <Space>cM "*P
nnoremap <Space>cm "*p
nnoremap <Space>CV "+P
nnoremap <Space>cV "+P
nnoremap <Space>cv "+p
nnoremap <Space>D <cmd>Sayonara!<CR>
nnoremap <Space>d <cmd>Sayonara<CR>
nnoremap <Space>e :<C-u>e %/
nnoremap <Space>E <cmd>e<CR>
nnoremap <Space>fc :<C-u>e ~/.config/
nnoremap <Space>fd <cmd>Mkdir %/
nnoremap <Space>fe :<C-u>e %/
nnoremap <Space>fm :<C-u>Move %
nnoremap <Space>fs <cmd>w<CR>
nnoremap <Space>fu :<C-u>e ~/
nnoremap <Space>gB <cmd>Git blame<CR>
nnoremap <Space>gC <cmd>Git commit -s<CR>
nnoremap <Space>gc <cmd>Git commit -s<CR>
nnoremap <Space>GD <cmd>Gdiffsplit! HEAD<CR>
nnoremap <Space>gD <cmd>Gdiffsplit! HEAD<CR>
nnoremap <Space>gd <cmd>Gdiffsplit!<CR>
nnoremap <Space>ge <cmd>Gedit<CR>
nnoremap <Space>gl <cmd>0Gclog<CR>
nnoremap <Space>gL <cmd>Gclog<CR>
nnoremap <Space>gm :<C-u>GMove 
nnoremap <Space>gP :<C-u>Git push 
nnoremap <Space>gp <cmd>Git push<CR>
nnoremap <Space>gs <cmd>Git<CR>
nnoremap <Space>gU :<C-u>git pull 
nnoremap <Space>gu <cmd>Git pull --rebase --prune<CR>
nnoremap <Space>gw <cmd>Gwrite<CR>
nnoremap <Space>H <C-w>H
nnoremap <Space>h <C-w>h
nnoremap <Space>J <C-w>J
nnoremap <Space>j <C-w>j
nnoremap <Space>K <C-w>K
nnoremap <Space>k <C-w>k
nnoremap <Space>L <C-w>L
nnoremap <Space>l <C-w>l
nnoremap <Space>o <C-w>p<CR>
nnoremap <Space>pc <cmd>Dirvish ~/.config<CR>
nnoremap <Space>pp <cmd>pwd<CR>
nnoremap <Space>pv <cmd>Dirvish ~/.config/nvim<CR>
nnoremap <Space>qq <cmd>qa<CR>
nnoremap <Space>R <cmd>e!<CR>
nnoremap <Space>SS :<C-u>Obsession ~/.sessions/
nnoremap <Space>ss :<C-u>so ~/.sessions/
nnoremap <Space>te <cmd>tabe<CR>
nnoremap <Space>tn <cmd>tabnew<CR>
nnoremap <Space>tr <cmd>call neoterm#repl#term(b:neoterm_id)<CR>
nnoremap <Space>TS <cmd>split +call\ TnewHere()<CR>
nnoremap <Space>tS <cmd>split +call\ TnewHere()<CR>
nnoremap <Space>ts <cmd>split +Tnew<CR>
nnoremap <Space>TT <cmd>tabe +call\ TnewHere()<CR>
nnoremap <Space>tT <cmd>tabe +call\ TnewHere()<CR>
nnoremap <Space>tt <cmd>tabe +Tnew<CR>
nnoremap <Space>TV <cmd>vsplit +call\ TnewHere()<CR>
nnoremap <Space>tV <cmd>vsplit +call\ TnewHere()<CR>
nnoremap <Space>tv <cmd>vsplit +Tnew<CR>
nnoremap <Space>w <C-w>
nnoremap <Space>wd <C-w>c
nnoremap <Space>we <cmd>vnew<CR>
nnoremap <Space>wS <cmd>new<CR>
nnoremap <Space>wt <cmd>tabe %<CR>
nnoremap <Space>wV <cmd>vnew<CR>
nnoremap <Space>x <cmd>x<CR>

" auto commands {{{1

augroup ft_text
  au!
  " au FileType *							setlocal iskeyword+=_
  au FileType mail,help,debchangelog,tex,plaintex,txt,asciidoc,markdown,org,yaml
        \ setlocal formatoptions=t iskeyword+=- textwidth=72 complete+=kspell sw=2 ts=2 sts=2
  au FileType debchangelog,gitcommit,hg	setlocal spell spelllang=en
  au FileType help,man						setlocal nolist
augroup END

augroup ft_programming
  au!
  au FileType dosbatch					setlocal commentstring=::\ %s
  au FileType typescript,javascript		setlocal ts=2 sw=2 sts=2
  au FileType c							setlocal commentstring=/*%s*/
  au FileType cpp						setlocal commentstring=//%s
  au FileType vue,svelte				setlocal shiftwidth=2 softtabstop=2 tabstop=2
  au FileType *							setlocal foldcolumn=1
augroup END

augroup ft_general
  au!
  au BufReadPost,BufNewFile Dockerfile-*	setf dockerfile
  au BufReadPost,BufNewFile .env*			setf conf
  au BufReadPost,BufNewFile *.jsonld		setf json
  au BufReadPost,BufNewFile *.mjs,*.cjs		setf javascript
  au BufReadPost,BufNewFile *.ts			setf typescript
  au BufReadPost,BufNewFile *				setlocal cpoptions-=J formatoptions+=rcjnq formatoptions-=o " o is really annoying
  au FocusGained *							checktime " run checks like autoread as soon as vim regains focus
  au InsertLeave *							set nopaste " disable paste when leaving insert mode
augroup END

" keybindings {{{1
" make S behave like C
nnoremap S s$

" replace within the visual selection
xnoremap s :<C-u>%s/\%V
" use the same exit key for vim that's also configured in the terminal
inoremap <C-\><C-\> <Esc>
inoremap  <Esc>
inoremap <C-/><C-/> <Esc>
noremap <C-\><C-\> <Esc>
noremap  <Esc>
noremap <C-/><C-/> <Esc>
cnoremap <C-\><C-\> <Esc>
cnoremap  <Esc>
cnoremap <C-/><C-/> <Esc>

" shortcut for exiting terminal input mode
tnoremap <C-\><C-\> <C-\><C-n>
tnoremap  <C-\><C-n>
tnoremap <C-/><C-/> <C-\><C-n>

" make Shift-Insert paste contents of the clipboard into terminal
tnoremap <S-Insert> <C-\><C-N>"*pi

" Enable the same behavior to <C-n> and <Down> / <C-p> and <Up> in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" disable search when redrawing the screen
nnoremap <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><Bar>redraw!<Bar>syntax sync fromstart<CR>

" http://vim.wikia.com/wiki/Prevent_escape_from_moving_the_cursor_one_character_to_the_left
inoremap <silent> <Esc> <Esc>`^

function! InsertCommentstring()
	let [l, r] = split(substitute(substitute(&commentstring,'\S\zs%s',' %s',''),'%s\ze\S','%s ',''),'%s',1)
	let col = col('.')
	let line = line('.')
	let g:ics_pos = [line, col + strlen(l)]
	return l.r
endfunction
function! ICSPositionCursor()
	call cursor(g:ics_pos[0], g:ics_pos[1])
	unlet g:ics_pos
endfunction
inoremap <C-c> <C-r>=InsertCommentstring()<CR><C-o>:call ICSPositionCursor()<CR>

" plugins {{{1

" AutoPairs {{{2
let g:AutoPairsMapSpace = 1
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutToggle = '<M-p>'
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsMapCh = 0

" dirvish {{{2
let g:dirvish_mode = ':sort ,^.*[\/],'

augroup my_dirvish_events
    autocmd!
    " Map t to "open in new tab".
    autocmd FileType dirvish
                \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
                \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

    " Enable :Gstatus and friends.
    " autocmd FileType dirvish call fugitive#detect(@%)

    " Map `gh` to hide dot-prefixed files.
    " To "toggle" this, just press `R` to reload.
    autocmd FileType dirvish nnoremap <silent><buffer>
                \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d<cr>

    autocmd FileType dirvish nnoremap <buffer>
                \ <space>e :e %/
augroup END

" editorconfig {{{2
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

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

" Fugitive {{{2
autocmd BufReadPost fugitive://* set bufhidden=delete

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
            \ },
            \ 'active' : {
            \ 'left': [ [ 'winnr', 'mode', 'paste' ],
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
        return strlen(_) ? _ . ' ' : ''
    endif
    return ''
endfunction

" neoterm {{{2
let g:neoterm_direct_open_repl=0
let g:neoterm_open_in_all_tabs=1
let g:neoterm_autoscroll=1
let g:neoterm_term_per_tab=1
let g:neoterm_autoinsert=1
let g:neoterm_automap_keys='<F23>'

function! TnewHere()
    call neoterm#new({ 'cwd': expand('%:h:p') })
endfunction

" rsi {{{2
let g:rsi_no_meta = 1

" Subversive {{{2
nmap gR <plug>(SubversiveSubstituteToEndOfLine)
nmap gr <plug>(SubversiveSubstitute)
nmap grr <plug>(SubversiveSubstituteLine)

nmap grs <plug>(SubversiveSubstituteRange)
xmap grs <plug>(SubversiveSubstituteRange)
nmap grss <plug>(SubversiveSubstituteWordRange)

" vi {{{1
" vi: ft=vim:tw=80:sw=4:ts=4:sts=4:et:fdm=marker
