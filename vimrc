function! Split(path) abort
    if type(a:path) != v:t_string
        return []
    endif
    return split(a:path, ',')
endfunction

function! Dirsep() abort
    return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction

function! IsSubDir(subdir) abort
    function! Filter(key, value) abort closure
        return isdirectory(join([a:value, a:subdir], Dirsep()))
    endfunction
    return funcref("Filter")
endfunction

function! FindSubDirInPath(path, subdir) abort
    return map(filter(Split(a:path), IsSubDir(a:subdir)), {key, value -> join([value, a:subdir], Dirsep())})
endfunction

set runtimepath+=join(FindSubDirInPath(&runtimepath, "pathogen"), ',')

execute pathogen#infect()

" put any local configuration in here
runtime! local-vimrc
