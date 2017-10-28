if isdirectory(expand(EverVimBundleDir("deoplete.nvim")))
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#auto_complete_start_length = 2
    inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
endif
