set incsearch
set hlsearch

" perl -cw buffer, using a temp file, into a new window
function! PerlCW()
    let l:tmpfile1 = tempname()
    let l:tmpfile2 = tempname()

    execute "normal:w!" . l:tmpfile1 . "\<CR>"
    execute "normal:! perl -cw ".l:tmpfile1." \> ".l:tmpfile2." 2\>\&1 \<CR>"
    execute "normal:new\<CR>"
    execute "normal:edit " . l:tmpfile2 . "\<CR>"
endfunction

" perl buffer, using a temp file, into a new window
function! PerlOutput()
    let l:tmpfile1 = tempname()
    let l:tmpfile2 = tempname()
    
    execute "normal:w!" . l:tmpfile1 . "\<CR>"
    execute "normal:! perl ".l:tmpfile1." \> ".l:tmpfile2." 2\>\&1 \<CR>"
    execute "normal:new\<CR>"
    execute "normal:edit " . l:tmpfile2 . "\<CR>"
endfunction

" Settings for editing perl source (plus bind the above two functions)
function! MyPerlSettings()
    if !did_filetype()
        set filetype=perl
    endif

    set textwidth=80
    set expandtab
    set tabstop=2
    set shiftwidth=2
    set cindent
    set comments=:#
    set formatoptions=croql
    set keywordprg=man\ -S\ 3
    
    noremap <f1> <Esc>:call PerlCW()<CR><Esc>
    noremap <f3> <Esc>:call PerlOutput()<CR><Esc>
   
endfunction

" Settings for editing python source
function! MyPythonSettings()
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set comments=:#
endfunction

" Settings for editing perl source (plus bind the above two functions)
function! MyPhpSettings()
    if !did_filetype()
        set filetype=php
    endif

    set textwidth=80
    set noexpandtab
    set tabstop=4
    set shiftwidth=4
    set smartindent
    set comments=:#
endfunction

" Settings for editing c/c++ source
function! MyCCppSettings()
    if !did_filetype()
        set filetype=c
    endif

    set textwidth=80
    set noexpandtab
    set tabstop=4
    set shiftwidth=4
    set smartindent
    set comments=://
endfunction

" Settings for editing javascript source
function! MyJavaScriptSettings()
    if !did_filetype()
        set filetype=javascript
    endif

    set textwidth=80
    set expandtab
    set tabstop=2
    set shiftwidth=2
    set cindent
    set comments=://
endfunction

set smartindent expandtab tabstop=4 shiftwidth=4

autocmd FileType perl :call MyPerlSettings()
autocmd FileType python :call MyPythonSettings()
autocmd FileType php :call MyPhpSettings()
autocmd FileType cpp :call MyCCppSettings()
autocmd FileType c :call MyCCppSettings()
autocmd FileType javascript :call MyJavaScriptSettings()

let g:easytags_file = './tags'
let g:loaded_easytags = 1
call pathogen#infect()
syntax on

"colorscheme darkblue

let curv = getcwd() . "/.vimrc"
if filereadable(curv) && curv != "/home/lex/.vimrc"
    silent execute 'source ' . curv
endif
