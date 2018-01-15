function! Split(path) abort
    if type(a:path) != type("")
        return []
    endif
    return split(a:path, ',')
endfunction

function! Dirsep() abort
    return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction

function! IsSubDir(path, subdir) abort
    return isdirectory(join([a:path, a:subdir], Dirsep()))
endfunction

function! JoinPath(path, subdir)
    return fnameescape(join([a:path, a:subdir], Dirsep()))
endfunction

function! FindSubDirInPath(path, subdir) abort
    return map(filter(Split(a:path), "IsSubDir(v:val, a:subdir)"), "JoinPath(v:val, a:subdir)")
endfunction

execute "set runtimepath+=".join(FindSubDirInPath(&runtimepath, "pathogen"), ',')

execute pathogen#infect()

" put any local configuration in this file
runtime! vimrc-local
