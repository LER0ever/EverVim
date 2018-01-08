if isdirectory(expand(EverVimBundleDir('vim-header')))
    nnoremap <Leader>eh :AddHeader<CR>
    let g:header_auto_add_header = 0
    let g:header_alignment = 1
endif
