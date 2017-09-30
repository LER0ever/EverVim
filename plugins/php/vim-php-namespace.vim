if isdirectory(expand(EverVimBundleDir('vim-php-namespace')))
    " Automatic insert use according to source code
    function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
    autocmd FileType php inoremap <Leader>lu <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>lu :call PhpInsertUse()<CR>
    " Expand class
    function! IPhpExpandClass()
        call PhpExpandClass()
        call feedkeys('a', 'n')
    endfunction
    autocmd FileType php inoremap <Leader>le <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <Leader>le :call PhpExpandClass()<CR>
    " Sort uses
    let g:php_namespace_sort_after_insert = 1
    autocmd FileType php inoremap <Leader>ls <Esc>:call PhpSortUse()<CR>
    autocmd FileType php noremap <Leader>ls :call PhpSortUse()<CR>
endif
