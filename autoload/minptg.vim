function! minptg#split(path) abort
    if type(a:path) != type("")
        return []
    endif
    return split(a:path, ',')
endfunction

function! minptg#dirsep() abort
    return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction

function! minptg#issubdir(path, subdir) abort
    return isdirectory(minptg#join(a:path, a:subdir))
endfunction

function! minptg#join(path, subdir)
    return join([a:path, a:subdir], minptg#dirsep())
endfunction

function! minptg#findsubdir(path, subdir) abort
    return map(filter(minptg#split(a:path), "minptg#issubdir(v:val, a:subdir)"), "minptg#join(v:val, a:subdir)")
endfunction

function! minptg#addtortp(dir) abort
    execute "set runtimepath+=".fnameescape(a:dir)
endfunction
