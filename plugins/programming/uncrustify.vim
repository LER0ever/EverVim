if isdirectory(expand(EverVimBundleDir("vim-uncrustify")))
    autocmd FileType c noremap <buffer> <Leader>fm :call Uncrustify('c')<CR>
    autocmd FileType c vnoremap <buffer> <Leader>fm :call RangeUncrustify('c')<CR>
    autocmd FileType cpp noremap <buffer> <Leader>fm :call Uncrustify('cpp')<CR>
    autocmd FileType cpp vnoremap <buffer> <Leader>fm :call RangeUncrustify('cpp')<CR>
endif
