set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
if isdirectory(expand(EverVimBundleDir("sessionman.vim")))
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>
endif
