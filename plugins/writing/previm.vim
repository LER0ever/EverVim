if isdirectory(expand(EverVimBundleDir("previm")))
    autocmd FileType markdown nnoremap <Leader>lp :PrevimOpen<CR>
endif
