if isdirectory(expand(EverVimBundleDir('ctrlsf.vim')))
    nnoremap <leader>sf :CtrlSF<space>
    nnoremap <leader>st :CtrlSFToggle<CR>
endif
