" put any pre configuration settings in this file
runtime! vimrc-local-pre

" initialize pathogen / runtimepath
call map(minptg#findsubdir(&runtimepath, "pathogen"), "minptg#addtortp(v:val)")

execute pathogen#infect()

" put any other local configuration settings in this file
runtime! vimrc-local
